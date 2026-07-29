class_name PartyButtons extends Menu

@onready var party: Array = Data.party

func _ready() -> void:
	super._ready()
	
	for i in range(get_child_count()):
		if i < party.size():
			get_child(i).data = party[i]
		else:
			get_child(i).data = null

func toggle_frame(frame: PlayerClass.FRAME, i: int):
	var player_button: PlayerButton = get_child(i)
	player_button.set_sprite(frame)
