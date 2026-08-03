class_name Equipment extends Resource

@export var name: String = ''

# TODO either add a way for the sprites to vary based on the equipping character or commit to drawing sprites that work regardless of class

@export var standby_sprite: Texture = null
@export var idle_sprite: Texture = null
@export var attacking_sprite: Texture = null
@export var damaged_sprite: Texture = null

func get_sprite(frame: PlayerClass.FRAME) -> Texture:
	match frame:
		PlayerClass.FRAME.IDLE:
			return idle_sprite
		PlayerClass.FRAME.STANDBY:
			return standby_sprite
		PlayerClass.FRAME.ATTACKING:
			return attacking_sprite
		PlayerClass.FRAME.DAMAGED:
			return damaged_sprite
	
	return null
