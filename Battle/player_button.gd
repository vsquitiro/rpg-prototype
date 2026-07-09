class_name PlayerButton extends TextureButton

const PARTY_POSITIONS: Array[Vector2] = [
	Vector2(0,2),
	Vector2(32,4),
	Vector2(64,6),
	Vector2(23,-26),
	Vector2(55,-24),
	Vector2(87,-22),
]

var data: BattleActorPlayer = null:
	set(value):
		data = value
		
		if data:
			data = data.new()
			# TODO reassess this method after learning more about GODOT
			self.texture_normal = ResourceLoader.load("res://Battle/Art/Party/Combat/%s_standby.png" % BattleActorPlayer.PlayerClass.keys()[data.player_class])
			self.position = PARTY_POSITIONS[data.pos]
			show()
		else:
			hide()
