class_name BattleWeapon extends Control

@onready var weapon_sprite: TextureRect = $WeaponSprite
@onready var shadow_sprite: TextureRect = $ShadowSprite

# TODO eventually make this work for other frame types
func set_sprite(weapon: Weapon) -> void:
	weapon_sprite.texture = weapon.sprite
	shadow_sprite.texture = weapon.shadow
	position = weapon.get_position()
