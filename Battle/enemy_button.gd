class_name EnemyButton extends BattleActorButton

const ENEMY_POSITIONS: Array[Vector2] = [
	Vector2(151,39),
	Vector2(113,41),
	Vector2(75,43),
	Vector2(37,45),
	Vector2(122,2),
	Vector2(84,4),
	Vector2(46,6),
	Vector2(8,8),
]

func get_hit_text_offset() -> Vector2:
	# TODO can extend for different enemy sizes
	return Vector2(-4,20)

@export var data: BattleActorEnemy = null :
	set(value):
		data = value.new()
		data.hp_changed.connect(_on_data_hp_changed)
		texture_normal = data.sprite
		position = ENEMY_POSITIONS[data.pos]
