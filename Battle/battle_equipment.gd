class_name BattleEquipment extends Control

@onready var equipment_sprite: TextureRect = $EquipmentSprite
@onready var shadow_sprite: TextureRect = $ShadowSprite

# TODO eventually make this work for other frame types
func set_sprite(equipment: Equipment, frame: PlayerClass.FRAME) -> void:
	var sprite_dict = equipment.get_sprite_dict(frame)
	equipment_sprite.texture = sprite_dict.sprite
	shadow_sprite.texture = sprite_dict.shadow
	var position_dict = equipment.get_position_dict(frame)
	position = position_dict.position
	shadow_sprite.z_index = position_dict.order
	equipment_sprite.z_index = position_dict.order + 1
	
