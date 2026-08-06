class_name PlayerButton extends BattleActorButton

@onready var _sprite: TextureRect = $Sprite
@onready var _animation_player: AnimationPlayer = $AnimationPlayer

const BATTLE_EQUIPMENT: PackedScene = preload("res://Battle/battle_equipment.tscn")

const PARTY_POSITIONS: Array[Vector2] = [
	Vector2(0,2),
	Vector2(32,4),
	Vector2(64,6),
	Vector2(23,-26),
	Vector2(55,-24),
	Vector2(87,-22),
]

var current_frame: PlayerClass.FRAME = PlayerClass.FRAME.IDLE
var weapon: BattleEquipment = null
var offhand: BattleEquipment = null

func get_hit_text_offset() -> Vector2:
	return Vector2(-4,12)

var data: BattleActorPlayer = null:
	set(value):
		data = value
		
		if data:
			data.hp_changed.connect(_on_data_hp_changed)
			data.attack_initiated.connect(_on_attack_initiated)
			data.display_damage.connect(_on_display_damage)
			position = PARTY_POSITIONS[data.pos]
			
			if data.weapon:
				weapon = BATTLE_EQUIPMENT.instantiate()
				_sprite.add_child(weapon)
				weapon.set_instant(data.weapon.instant_sprite, data.weapon.type.instant_pos)
			if data.offhand:
				offhand = BATTLE_EQUIPMENT.instantiate()
				_sprite.add_child(offhand)
				
			set_sprite(PlayerClass.FRAME.IDLE)
			
			show()
		else:
			hide()

func set_sprite(frame: PlayerClass.FRAME):
	current_frame = frame
	_sprite.texture = data.player_class.get_sprite(frame)
	if data.weapon && weapon:
		weapon.set_sprite(data.weapon, frame)
	if data.offhand && offhand:
		offhand.set_sprite(data.offhand, frame)
		
func _on_attack_initiated() -> void:
	set_sprite(PlayerClass.FRAME.ATTACKING)
	weapon.flash_instant()
	await(get_tree().create_timer(Timers.BASIC_TURN).timeout)
	set_sprite(PlayerClass.FRAME.IDLE)

func _on_display_damage(_instant) -> void:
	var resetFrame = current_frame
	set_sprite(PlayerClass.FRAME.DAMAGED)
	_animation_player.play("basic_damage")
	await(get_tree().create_timer(Timers.BASIC_TURN).timeout)	
	if resetFrame == PlayerClass.FRAME.ATTACKING:
		set_sprite(PlayerClass.FRAME.IDLE)
	else:
		set_sprite(resetFrame)
	
