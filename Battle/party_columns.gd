class_name PartyColumns extends HBoxContainer

@onready var party: Array = Data.party

func _ready() -> void:
	for i in range(get_child_count()):
		if i < party.size():
			get_child(i).data = party[i]
		else:
			get_child(i).data = null

func toggle_active_window(i: int, active: bool):
	get_child(i).toggle_active_window(active)
