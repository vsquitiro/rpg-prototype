class_name EquipmentType extends Resource

@export var name: String = ''

@export var idle_shadow: Texture = null
@export var idle_pos: Vector2 = Vector2(0,0)
@export var idle_order: int = 0

@export var standby_shadow: Texture = null
@export var standby_pos: Vector2 = Vector2(0,0)
@export var standby_order: int = 0

@export var attacking_shadow: Texture = null
@export var attacking_pos: Vector2 = Vector2(0,0)
@export var attacking_order: int = 0

@export var damaged_shadow: Texture = null
@export var damaged_pos: Vector2 = Vector2(0,0)
@export var damaged_order: int = 0

func get_shadow(frame: PlayerClass.FRAME) -> Texture:
	match frame:
		PlayerClass.FRAME.STANDBY:
			return standby_shadow
		PlayerClass.FRAME.IDLE:
			return idle_shadow
		PlayerClass.FRAME.ATTACKING:
			return attacking_shadow
		PlayerClass.FRAME.DAMAGED:
			return damaged_shadow
	return null

func get_pos(frame: PlayerClass.FRAME) -> Vector2:
	match frame:
		PlayerClass.FRAME.STANDBY:
			return standby_pos
		PlayerClass.FRAME.IDLE:
			return idle_pos
		PlayerClass.FRAME.ATTACKING:
			return attacking_pos
		PlayerClass.FRAME.DAMAGED:
			return damaged_pos
	return Vector2(0,0)
	
func get_order(frame: PlayerClass.FRAME) -> int:
	match frame:
		PlayerClass.FRAME.STANDBY:
			return standby_order
		PlayerClass.FRAME.IDLE:
			return idle_order
		PlayerClass.FRAME.ATTACKING:
			return attacking_order
		PlayerClass.FRAME.DAMAGED:
			return damaged_order
	return 0
