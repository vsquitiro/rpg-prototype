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
	var hit_text: Label = HIT_TEXT.instantiate()
	hit_text.text = str(abs(hp_delta))
	add_child(hit_text)
	hit_text.position = Vector2(0,0)
	
	
	if hp <= 0:
		# TODO this just deletes the node, def need to animate, may need treasure exp etc
		queue_free()
