@abstract class_name Equipment extends Resource

@export var name: String = ''

# TODO either add a way for the sprites to vary based on the equipping character or commit to drawing sprites that work regardless of class

@export var standby_sprite: Texture = null
@export var idle_sprite: Texture = null
@export var attacking_sprite: Texture = null

@export var standby_shadow: Texture = null
@export var idle_shadow: Texture = null
@export var attacking_shadow: Texture = null


func get_sprite_dict(frame: PlayerClass.FRAME) -> Dictionary:
	match frame:
		PlayerClass.FRAME.IDLE:
			return { 'sprite': idle_sprite, 'shadow': idle_shadow }
		PlayerClass.FRAME.STANDBY:
			return { 'sprite': standby_sprite, 'shadow': standby_shadow }
		PlayerClass.FRAME.ATTACKING:
			return { 'sprite': attacking_sprite, 'shadow': attacking_shadow}
	
	return { 'sprite': null, 'shadow': null }

@abstract func get_position_dict(frame: PlayerClass.FRAME) -> Dictionary
