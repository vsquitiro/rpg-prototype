class_name Battle extends Control

# TODO For now following tutorial but will only get the left three buttons
@onready var _commands_menu: Menu = $MarginContainer/VBoxContainer/Bottom/Commands/MarginContainer/CommandMenu
@onready var _enemies_front_row: Control = $MarginContainer/VBoxContainer/Combatants/Enemies/EnemyFrontRow
#@onready var _enemies_back_row: Menu = $MarginContainer/VBoxContainer/Combatants/Enemies/EnemyBackRow

func _ready() -> void:
	# TODO just changing color - when cursor is implemented evaluate whether color change is needed
	_commands_menu.button_focus(0)

func _on_command_menu_button_focused(_button: BaseButton) -> void:
	pass # Replace with function body.

func _on_command_menu_button_pressed(button: BaseButton) -> void:
	# TODO remove after debugging
	print(button.text)
	match button.text:
		"Attack":
			print('Ah yeah we fighting')
			#_enemies_front_row.button_focus()
