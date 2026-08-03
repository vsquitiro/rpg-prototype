class_name BattleEquipment extends Control

@onready var instant_sprite: TextureRect = $InstantSprite
@onready var equipment_sprite: TextureRect = $EquipmentSprite
@onready var shadow_sprite: TextureRect = $ShadowSprite

const TOTAL_SPRITE_LAYERS: int = 3

func set_sprite(equipment: Equipment, frame: PlayerClass.FRAME) -> void:
	equipment_sprite.texture = equipment.get_sprite(frame)
	shadow_sprite.texture = equipment.type.get_shadow(frame)

	position = equipment.type.get_pos(frame)
	shadow_sprite.z_index = (equipment.type.get_order(frame) * TOTAL_SPRITE_LAYERS)
	equipment_sprite.z_index = (equipment.type.get_order(frame) * TOTAL_SPRITE_LAYERS) + 1
	instant_sprite.z_index = (equipment.type.get_order(frame) * TOTAL_SPRITE_LAYERS) + 2
	
func set_instant(sprite: Texture, pos: Vector2) -> void:
	instant_sprite.hide()
	instant_sprite.texture = sprite
	instant_sprite.position = pos

func flash_instant() -> void:
	instant_sprite.show()
	await(get_tree().create_timer(0.1).timeout)
	instant_sprite.hide()
