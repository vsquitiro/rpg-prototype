class_name Battle extends Control

enum MENU_TARGET {
	OPTIONS,
	COMBATANTS,
}

var party: Array = Data.party
var command: EventQueue.COMMAND = EventQueue.COMMAND.ATTACK
var current_player_index: int = -1

var menu_target: MENU_TARGET = MENU_TARGET.OPTIONS

@onready var event_queue: EventQueue = $EventQueue
@onready var _commands: NinePatchRect = $MarginContainer/BattlePane/Bottom/MarginContainer/Commands
@onready var _commands_menu: Menu = $MarginContainer/BattlePane/Bottom/MarginContainer/Commands/MarginContainer/CommandMenu
@onready var _enemy_buttons: Menu = $MarginContainer/BattlePane/Combatants/EnemyArea/EnemyButtons
@onready var _party_buttons: Menu = $MarginContainer/BattlePane/Combatants/PartyArea/PartyButtons
@onready var _party_hexes: PartyHexes = $MarginContainer/BattlePane/Combatants/PartyArea/PartyHexes
@onready var _party_columns: PartyColumns = $MarginContainer/BattlePane/Bottom/PartyStats/MarginContainer/PartyColumns
@onready var _menu_cursor: TextureRect = $MenuCursor
@onready var _info_pane: InfoPane = $MarginContainer/BattlePane/MarginContainer/InfoPane


var _button_groups = []

func _ready() -> void:	
	_button_groups.append_array([_commands_menu,_enemy_buttons, _party_buttons])
	goto_next_player()

func goto_next_player() -> void:
	if current_player_index > -1:
		# TODO make a function to handle all aspects of activating/disactivating
		var inactive_hex = party[current_player_index].pos
		_party_hexes.toggle_hex_active(inactive_hex, false)
		_party_columns.toggle_active_window(current_player_index, false)
	current_player_index += 1
	
	if current_player_index >= Data.party.size():
		get_viewport().gui_release_focus()
		_commands_menu.button_focus()
		_menu_cursor.hide()
		_info_pane.hide()
		
		# TODO eventually genericize this, but for prototype use two snarl_bat enemies
		for enemy: EnemyButton in _enemy_buttons.get_buttons():
			# TODO set up actual targeting
			var target: BattleActor = party.pick_random() 
			# TODO hard coding ATTACK for now
			event_queue.add(EventQueue.COMMAND.ATTACK, enemy.data, target)
			
		_commands.hide()
		await(event_queue.run())
		current_player_index = 0
		
	#TODO check if player is alive
	var active_hex = party[current_player_index].pos
	_party_hexes.toggle_hex_active(active_hex, true)
	_party_buttons.toggle_frame(PlayerClass.FRAME.STANDBY, current_player_index)
	_party_columns.toggle_active_window(current_player_index, true)
	_commands.show()
	_commands_menu.button_focus()
	await get_tree().process_frame
	_menu_cursor.show()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		match menu_target:
			MENU_TARGET.OPTIONS:
				# TODO revert back to previoius player and cleanse event queue
				pass
			MENU_TARGET.COMBATANTS:
				menu_target = MENU_TARGET.OPTIONS
				_handle_focus_swap([_commands_menu])
				_commands_menu.button_focus()

func _on_command_menu_button_pressed(button: BaseButton) -> void:
	match button.text:
		"Attack":
			menu_target = MENU_TARGET.COMBATANTS
			command = EventQueue.COMMAND.ATTACK
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
