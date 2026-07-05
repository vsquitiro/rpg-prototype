class_name Menu extends Control

signal button_focused(button: BaseButton)
signal button_pressed(button: BaseButton)

var index: int = 0

func _ready() -> void:
	for button in get_buttons():
		button.focus_entered.connect(_on_button_focused.bind(button))
		button.pressed.connect(_on_button_pressed.bind(button))
	buttons_enable_focus(false)

func get_buttons() -> Array:
	return get_children()	

func buttons_enable_focus(on: bool) -> void:
	var mode: FocusMode = FocusMode.FOCUS_ALL if on else FocusMode.FOCUS_NONE
	for button: BaseButton in get_buttons():
		button.set_focus_mode(mode)

func button_focus(n: int = index) -> void:
	buttons_enable_focus(true)
	var button: BaseButton = get_buttons()[n]
	button.grab_focus()

func _on_button_focused(button: BaseButton) -> void:
	index = button.get_index()
	emit_signal("button_focused", button)
		
func _on_button_pressed(button: BaseButton) -> void:
	emit_signal("button_pressed", button)
