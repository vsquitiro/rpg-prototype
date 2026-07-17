class_name PartyHex extends TextureButton

@onready var _animation_player: AnimationPlayer = $AnimationPlayer

func toggle_hex_active(active: bool):
	if active:
		_animation_player.play("active")
	else:
		_animation_player.play("RESET")
