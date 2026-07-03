extends TextureRect

var target: Node = null
# Change offset based on wether it's text or combatantant buttons
const OFFSET: Vector2 = Vector2(-13,-8)

func _ready() -> void:
	get_viewport().gui_focus_changed.connect(_on_viewport_gui_focus_changed)
	set_process(false)
	
func _process(_delta: float) -> void:
	global_position = target.global_position + Vector2(0, (target.size.y/2)) + OFFSET
	
func _on_viewport_gui_focus_changed(node: Control) -> void:
	if node is BaseButton:
		target = node
		show()
		set_process(true)
	else:
		hide()
		set_process(false)
