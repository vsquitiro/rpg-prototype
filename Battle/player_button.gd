class_name PlayerButton extends BattleActorButton

const BATTLE_WEAPON: PackedScene = preload("res://Battle/battle_weapon.tscn")

const PARTY_POSITIONS: Array[Vector2] = [
	Vector2(0,2),
	Vector2(32,4),
	Vector2(64,6),
	Vector2(23,-26),
	Vector2(55,-24),
	Vector2(87,-22),
]

func get_hit_text_offset() -> Vector2:
	return Vector2(-4,12)

var data: BattleActorPlayer = null:
	set(value):
		data = value
		
		if data:
			print('the data is being set')
			# TODO change z index back for weaponsprite to something normal
			data.hp_changed.connect(_on_data_hp_changed)
			# TODO eventually change this to idle sprite
			texture_normal = data.player_class.standby_sprite
			position = PARTY_POSITIONS[data.pos]
			
			if data.weapon:
				var weapon: BattleWeapon = BATTLE_WEAPON.instantiate()
				add_child(weapon)
				weapon.set_sprite(data.weapon)
			
			show()
		else:
			hide()
