class_name InfoPane extends NinePatchRect

@onready var label: Label = $Label

func _ready() -> void:
	get_viewport().gui_focus_changed.connect(_on_viewport_gui_focus_changed)
	hide()

func _on_viewport_gui_focus_changed(node: Control) -> void:
	print('viewport focus changed:', node)
	if node is EnemyButton or node is PlayerButton:
		label.text = node.data.name
		show()
	else:
		hide()
