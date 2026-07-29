class_name PlayerClass extends Resource

enum FRAME {
	IDLE,
	STANDBY,
	ATTACKING
}

@export var name : String = ''

@export var idle_sprite: Texture = null
@export var standby_sprite: Texture = null
@export var attacking_sprite: Texture = null

func get_sprite(frame: FRAME) -> Texture:
	match frame:
		FRAME.IDLE:
			return idle_sprite
		FRAME.STANDBY:
			return standby_sprite
		FRAME.ATTACKING:
			return attacking_sprite
	return null

# TODO set up the separated portrait and border
@export var portrait_sprite : Texture = null
