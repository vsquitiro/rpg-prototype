class_name Offhand extends Equipment

enum OFFHAND_TYPE {
	BUCKLER_SHIELD
}

@export var offhand_type : OFFHAND_TYPE = OFFHAND_TYPE.BUCKLER_SHIELD

func get_position_dict(frame: PlayerClass.FRAME) -> Dictionary:
	match offhand_type:
		OFFHAND_TYPE.BUCKLER_SHIELD:
			match frame:
				PlayerClass.FRAME.IDLE:
					return { 'position': Vector2(13,8), 'order': 1 }
				PlayerClass.FRAME.STANDBY:
					return { 'position': Vector2(9,9), 'order': 0 }
				PlayerClass.FRAME.ATTACKING:
					return { 'position': Vector2(21,8), 'order': 0 }
			
	return { 'position': Vector2(0,0), 'order': 0 }
