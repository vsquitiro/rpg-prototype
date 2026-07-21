class_name PlayerButton extends BattleActorButton

const PARTY_POSITIONS: Array[Vector2] = [
	Vector2(0,2),
	Vector2(32,4),
	Vector2(64,6),
	Vector2(23,-26),
	Vector2(55,-24),
	Vector2(87,-22),
]

func get_hit_text_offset() -> Vector2:
	return Vector2(-4,12)

var data: BattleActorPlayer = null:
	set(value):
		data = value
		
		if data:
			data.hp_changed.connect(_on_data_hp_changed)
			texture_normal = data.sprite
			position = PARTY_POSITIONS[data.pos]
			show()
		else:
			hide()
