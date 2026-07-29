class_name Weapon extends Equipment

enum WEAPON_TYPE {
	LONGSWORD
}

@export var weapon_type : WEAPON_TYPE = WEAPON_TYPE.LONGSWORD

@export var instant_sprite : Texture = null

func get_position_dict(frame: PlayerClass.FRAME) -> Dictionary:
	match weapon_type:
		WEAPON_TYPE.LONGSWORD:
			match frame:
				PlayerClass.FRAME.IDLE:
					return { 'position': Vector2(10,7), 'order': 0 }
				PlayerClass.FRAME.STANDBY:
					return { 'position': Vector2(-3,-10), 'order': 0 }
				PlayerClass.FRAME.ATTACKING:
					return { 'position': Vector2(6,13), 'order': 0 }
	return {}

func get_instant_pos() -> Vector2:
	match weapon_type:
		WEAPON_TYPE.LONGSWORD:
			return Vector2(-10,-17)
	return Vector2(0,0)
