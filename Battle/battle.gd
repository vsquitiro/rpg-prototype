class_name Battle extends Control

enum MenuTargets {
	OPTIONS,
	COMBATANTS,
}

var command: EventQueue.Commands = EventQueue.Commands.ATTACK
var current_player_index: int = 0

var menu_target: MenuTargets = MenuTargets.OPTIONS

@onready var event_queue: EventQueue = $EventQueue
@onready var _commands_menu: Menu = $MarginContainer/VBoxContainer/Bottom/Commands/MarginContainer/CommandMenu
@onready var _enemies_front_row: Control = $MarginContainer/VBoxContainer/Combatants/Enemies/EnemiesFrontRow
@onready var _enemies_back_row: Control = $MarginContainer/VBoxContainer/Combatants/Enemies/EnemiesBackRow
@onready var _party_front_row: Control = $MarginContainer/VBoxContainer/Combatants/Party/PartyFrontRow
@onready var _party_back_row: Control = $MarginContainer/VBoxContainer/Combatants/Party/PartyBackRow
@onready var party_stats: PartyColumns = $MarginContainer/VBoxContainer/Bottom/PartyStats/MarginContainer/PartyColumns


var _combatant_button_groups = []
var _battle_buttons = []

func _ready() -> void:
	_battle_buttons.append(_commands_menu)
	_combatant_button_groups.append_array([_enemies_front_row, _enemies_back_row, _party_front_row, _party_back_row])
	_battle_buttons.append_array(_combatant_button_groups)
	_commands_menu.button_focus(0)

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
	# TODO remove after debugging
	print("Button pressed:", button.text)
	match button.text:
		"Attack":
			menu_target = MenuTargets.COMBATANTS
			command = EventQueue.Commands.ATTACK
			
			print('Starting Attack process')
			_handle_focus_swap(_combatant_button_groups)
			_enemies_front_row.button_focus()

func _on_enemy_front_row_button_pressed(button: BaseButton) -> void:
	var actor: BattleActor = Data.party[current_player_index]
	var target: BattleActor = button.data
	print(target.name, ": HP=", target.hp, "/", target.hp_max)
	event_queue.add(command, actor, target)

func _handle_focus_swap(to_enable: Array):
	for buttons in _battle_buttons:
		if buttons in to_enable:
			buttons.buttons_enable_focus(true)
		else:
			buttons.buttons_enable_focus(false)
