class_name Weapon extends Equipment

enum WEAPON_TYPE {
	LONGSWORD
}

@export var weapon_type : WEAPON_TYPE = WEAPON_TYPE.LONGSWORD

func get_position() -> Vector2:
	match weapon_type:
		WEAPON_TYPE.LONGSWORD:
			return Vector2(-3,-10)
			
	return Vector2(0,0)
