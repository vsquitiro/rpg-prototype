class_name Battle extends Control

enum MenuTargets {
	OPTIONS,
	COMBATANTS,
}

var party: Array = Data.party
var command: EventQueue.Commands = EventQueue.Commands.ATTACK
var current_player_index: int = 0

var menu_target: MenuTargets = MenuTargets.OPTIONS

@onready var event_queue: EventQueue = $EventQueue
@onready var _commands_menu: Menu = $MarginContainer/VBoxContainer/Bottom/Commands/MarginContainer/CommandMenu
@onready var _enemy_buttons: Menu = $MarginContainer/VBoxContainer/Combatants/EnemyArea/EnemyButtons
@onready var _party_buttons: Menu = $MarginContainer/VBoxContainer/Combatants/PartyArea/PartyButtons
@onready var party_stats: PartyColumns = $MarginContainer/VBoxContainer/Bottom/PartyStats/MarginContainer/PartyColumns


var _button_groups = []

func _ready() -> void:	
	_button_groups.append_array([_commands_menu,_enemy_buttons, _party_buttons])
	_commands_menu.button_focus(0)

func goto_next_player(dir: int = 1) -> void:
	# TODO not sure if I love this approach
	current_player_index += dir
	
	if current_player_index > Data.size():
		# TODO roll for enemy actions
		# TODO sort by speeds rolls
		pass
	else:
		# Activate next player
		pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		match menu_target:
			MenuTargets.OPTIONS:
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
	var actor: BattleActorPlayer = Data.party[current_player_index]
	var target: BattleActorEnemy = button.data
	print(button)
	print(target)
	print(target.name, ": HP=", target.hp, "/", target.hp_max)
	event_queue.add(command, actor, target)

func _handle_focus_swap(to_enable: Array):
	for buttons in _button_groups:
		if buttons in to_enable:
			buttons.buttons_enable_focus(true)
		else:
			buttons.buttons_enable_focus(false)
