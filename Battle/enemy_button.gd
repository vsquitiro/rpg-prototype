class_name EnemyButton extends BattleActorButton

@onready var _sprite: TextureRect = $Sprite
@onready var _instance: TextureRect = $Instance
@onready var _animation_player: AnimationPlayer = $AnimationPlayer

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

func _ready() -> void:
	if data:
		_sprite.texture = data.sprite

@export var data: BattleActorEnemy = null :
	set(value):
		data = value.new()
		data.hp_changed.connect(_on_data_hp_changed)
		data.display_damage.connect(_on_data_display_damage)
		if _sprite:
			_sprite.texture = data.sprite
		position = ENEMY_POSITIONS[data.pos]

# TODO eventually need to figure out what to do when character is unequipped
func _on_data_display_damage(instance_sprite: Texture) -> void:
	_instance.texture = instance_sprite
	_animation_player.play("basic_damage")
	
