class_name EnemyButton extends TextureButton

const HIT_TEXT: PackedScene = preload("res://Battle/hit_text.tscn")

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

@export var data: BattleActorEnemy = null :
	set(value):
		data = value.new()
		data.hp_changed.connect(_on_data_hp_changed)
		texture_normal = data.sprite
		position = ENEMY_POSITIONS[data.pos]

func _on_data_hp_changed(hp: int, hp_delta) -> void:
	var hit_text: HitText = HIT_TEXT.instantiate()
	add_child(hit_text)
	hit_text.size.x = size.x
	#hit_text.set_text(str(abs(hp_delta)))
	hit_text.set_text('2412')
	
	hit_text.position = Vector2(-4,20)
	
	# TODO think I need to make a (catch damage for after text changes)
	if hp <= 0:
		# TODO this just deletes the node, def need to animate, may need treasure exp etc
		queue_free()
