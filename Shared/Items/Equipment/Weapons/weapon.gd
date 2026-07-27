class_name Weapon extends Equipment

enum WEAPON_TYPE {
	LONGSWORD
}

@export var weapon_type : WEAPON_TYPE = WEAPON_TYPE.LONGSWORD

func get_position_dict(frame: PlayerClass.FRAME) -> Dictionary:
	match weapon_type:
		WEAPON_TYPE.LONGSWORD:
			match frame:
				PlayerClass.FRAME.IDLE:
					return { 'position': Vector2(10,7), 'order': 0 }
				PlayerClass.FRAME.STANDBY:
					return { 'position': Vector2(-3,-10), 'order': 0 }
			
	return { 'position': Vector2(0,0), 'order': 0 }
