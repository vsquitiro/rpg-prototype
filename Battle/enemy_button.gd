class_name EnemyButton extends TextureButton

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
		# TODO There are differences between player (show, hide, etc.) and enemy may need to adjust
		data = value.new()
		self.position = ENEMY_POSITIONS[data.pos]

#func _ready() -> void:
	
	#if data:
		#set_data(data)
