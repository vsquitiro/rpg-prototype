class_name BattleEquipment extends Control

@onready var instant_sprite: TextureRect = $InstantSprite
@onready var equipment_sprite: TextureRect = $EquipmentSprite
@onready var shadow_sprite: TextureRect = $ShadowSprite

const TOTAL_SPRITE_LAYERS: int = 3

func set_sprite(equipment: Equipment, frame: PlayerClass.FRAME) -> void:
	var sprite_dict = equipment.get_sprite_dict(frame)

	equipment_sprite.texture = sprite_dict.sprite
	shadow_sprite.texture = sprite_dict.shadow

	var position_dict = equipment.get_position_dict(frame)

	position = position_dict.position
	shadow_sprite.z_index = (position_dict.order * TOTAL_SPRITE_LAYERS)
	equipment_sprite.z_index = (position_dict.order * TOTAL_SPRITE_LAYERS) + 1
	instant_sprite.z_index = (position_dict.order * TOTAL_SPRITE_LAYERS) + 2
	
func set_instant(sprite: Texture, position: Vector2) -> void:
	instant_sprite.hide()
	instant_sprite.texture = sprite
	instant_sprite.position = position
