class_name Battle extends Control

enum States {
	OPTIONS,
	COMBATANTS,
}
var state: States = States.OPTIONS

@onready var _commands_menu: Menu = $MarginContainer/VBoxContainer/Bottom/Commands/MarginContainer/CommandMenu
@onready var _enemies_front_row: Control = $MarginContainer/VBoxContainer/Combatants/Enemies/EnemyFrontRow

func _ready() -> void:
	_commands_menu.button_focus(0)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		match state:
			States.OPTIONS:
				pass
			States.COMBATANTS:
				state = States.OPTIONS
				_commands_menu.button_focus()

func _on_command_menu_button_focused(_button: BaseButton) -> void:
	pass # TODO might not need this

func _on_command_menu_button_pressed(button: BaseButton) -> void:
	# TODO remove after debugging
	print(button.text)
	match button.text:
		"Attack":
			state = States.COMBATANTS
			print('Starting Attack process')
			_commands_menu.button_enable_focus(false)
			_enemies_front_row.button_focus()
