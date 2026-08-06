class_name EnemyButton extends BattleActorButton

@onready var _sprite: TextureRect = $Sprite
@onready var _instance: TextureRect = $Instance
@onready var _animation_player: AnimationPlayer = $AnimationPlayer
@onready var _ko_screen: AnimatedSprite2D = $KoScreen


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
		data = value
		if data: 
			data = value
			data.hp_changed.connect(_on_data_hp_changed)
			data.attack_initiated.connect(_on_attack_initiated)
			data.display_damage.connect(_on_data_display_damage)
			data.ko_initiated.connect(_on_ko_initiated)
			if _sprite:
				_sprite.texture = data.sprite
			position = ENEMY_POSITIONS[data.pos]
			show()
		else:
			hide()

# TODO eventually need to figure out what to do when character is unequipped
func _on_data_display_damage(instance_sprite: Texture) -> void:
	_instance.texture = instance_sprite
	_animation_player.play("basic_damage")
	
func _on_attack_initiated() -> void:
	for i in range(3):
		_sprite.texture = data.attacking_sprite
		await(get_tree().create_timer(Timers.ENEMY_ATTACK_FLASH).timeout)
		_sprite.texture = data.sprite
		await(get_tree().create_timer(Timers.ENEMY_ATTACK_FLASH).timeout)

func _on_ko_initiated() -> void:
	_sprite.z_index = -10
	_ko_screen.play()
	await(get_tree().create_timer(Timers.ENEMY_KO).timeout)
	queue_free()
	
