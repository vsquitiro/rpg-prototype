class_name Battle extends Control

enum MenuTargets {
	OPTIONS,
	COMBATANTS,
}

var party: Array = Data.party
var command: EventQueue.Commands = EventQueue.Commands.ATTACK
var current_player_index: int = -1

var menu_target: MenuTargets = MenuTargets.OPTIONS

@onready var event_queue: EventQueue = $EventQueue
@onready var _commands_menu: Menu = $MarginContainer/VBoxContainer/Bottom/Commands/MarginContainer/CommandMenu
@onready var _enemy_buttons: Menu = $MarginContainer/VBoxContainer/Combatants/EnemyArea/EnemyButtons
@onready var _party_buttons: Menu = $MarginContainer/VBoxContainer/Combatants/PartyArea/PartyButtons
@onready var _party_hexes: PartyHexes = $MarginContainer/VBoxContainer/Combatants/PartyArea/PartyHexes

var _button_groups = []

func _ready() -> void:	
	_button_groups.append_array([_commands_menu,_enemy_buttons, _party_buttons])
	goto_next_player()

func goto_next_player(dir: int = 1) -> void:
	# TODO not sure if I love this approach
	if current_player_index > -1:
		var inactive_hex = party[current_player_index].pos
		_party_hexes.toggle_hex_active(inactive_hex, false)
	current_player_index += dir
	
	if current_player_index >= Data.party.size():
		print('enemies initializing')
		# TODO eventually genericize this, but for prototype use two snarl_bat enemies
		for enemy: EnemyButton in _enemy_buttons.get_buttons():
			# TODO set up actual targeting
			var target: BattleActor = party.pick_random() 
			# TODO hard coding ATTACK for now
			event_queue.add(EventQueue.Commands.ATTACK, enemy.data, target)
			
		print('The event queue:', event_queue.events)
		#event_queue.run()
		pass
	else:
		#TODO check if player is alive
		var active_hex = party[current_player_index].pos
		_party_hexes.toggle_hex_active(active_hex, true)
		_commands_menu.button_focus()
		pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		match menu_target:
			MenuTargets.OPTIONS:
				# TODO revert back to previoius player and cleanse event queue
				pass
			MenuTargets.COMBATANTS:
				menu_target = MenuTargets.OPTIONS
				_handle_focus_swap([_commands_menu])
				_commands_menu.button_focus()

func _on_command_menu_button_focused(_button: BaseButton) -> void:
	pass # TODO might not need this

func _on_command_menu_button_pressed(button: BaseButton) -> void:
	print("Button pressed:", button.text)
	match button.text:
		"Attack":
			menu_target = MenuTargets.COMBATANTS
			command = EventQueue.Commands.ATTACK
			
			print('Starting Attack process')
			_handle_focus_swap([_enemy_buttons, _party_buttons])
			_enemy_buttons.button_focus()

func _on_enemy_buttons_button_pressed(button: BaseButton) -> void:
	_target_battle_actor(button.data)

func _on_party_buttons_button_pressed(button: BaseButton) -> void:
	_target_battle_actor(button.data)

func _target_battle_actor(target: BattleActor) -> void:
	print(target.name, ": HP=", target.hp, "/", target.hp_max)
	event_queue.add(command, Data.party[current_player_index], target)
	goto_next_player()

func _handle_focus_swap(to_enable: Array):
	for buttons in _button_groups:
		if buttons in to_enable:
			buttons.buttons_enable_focus(true)
		else:
			buttons.buttons_enable_focus(false)
