class_name PlayerButton extends BattleActorButton

const BATTLE_EQUIPMENT: PackedScene = preload("res://Battle/battle_equipment.tscn")

const PARTY_POSITIONS: Array[Vector2] = [
	Vector2(0,2),
	Vector2(32,4),
	Vector2(64,6),
	Vector2(23,-26),
	Vector2(55,-24),
	Vector2(87,-22),
]

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
			position = PARTY_POSITIONS[data.pos]
			
			if data.weapon:
				weapon = BATTLE_EQUIPMENT.instantiate()
				add_child(weapon)
				weapon.set_instant(data.weapon.instant_sprite, data.weapon.get_instant_pos())
			if data.offhand:
				offhand = BATTLE_EQUIPMENT.instantiate()
				add_child(offhand)
				
			# TODO set to normal
			#set_sprite(PlayerClass.FRAME.IDLE)
			set_sprite(PlayerClass.FRAME.DAMAGED)
			
			show()
		else:
			hide()

func set_sprite(frame: PlayerClass.FRAME):
	texture_normal = data.player_class.get_sprite(frame)
	if data.weapon && weapon:
		weapon.set_sprite(data.weapon, frame)
	if data.offhand && offhand:
		offhand.set_sprite(data.offhand, frame)
		
func _on_attack_initiated() -> void:
	set_sprite(PlayerClass.FRAME.ATTACKING)
	weapon.flash_instant()
	await(get_tree().create_timer(0.5).timeout)
	set_sprite(PlayerClass.FRAME.IDLE)
	return
