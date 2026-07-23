@abstract class_name Equipment extends Resource

@export var name : String = ''

# TODO either add a way for the sprites to vary based on the equipping character or commit to drawing sprites that work regardless of class

@export var sprite : Texture = null
@export var shadow : Texture = null

@abstract func get_position() -> Vector2
