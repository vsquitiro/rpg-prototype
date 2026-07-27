class_name PlayerClass extends Resource

# TODO should probably find a shared place for this
enum FRAME {
	IDLE,
	STANDBY
}

@export var name : String = ''

@export var idle_sprite : Texture = null
@export var standby_sprite : Texture = null

func get_sprite(frame: FRAME) -> Texture:
	match frame:
		FRAME.IDLE:
			return idle_sprite
		FRAME.STANDBY:
			return standby_sprite
	return null

# TODO set up the separated portrait and border
@export var portrait_sprite : Texture = null
