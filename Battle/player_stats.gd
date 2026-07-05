class_name PlayerStats extends VBoxContainer

@onready var portrait: TextureRect = $Graphics/Portrait
@onready var player_position: TextureRect = $Graphics/PlayerPosition
@onready var player_name: Label = $PlayerName
@onready var hp: Label = $Health/HP
@onready var hp_max: Label = $Health/HPMax

var data: BattleActor = null:
	set(value):
		data = value
		
		if data:
			data = data.new()
			player_name.text = data.name
			hp.text = str(data.hp) + '/'
			hp_max.text = str(data.hp_max)
			# TODO reassess this method after learning more about GODOT
			portrait.texture=ResourceLoader.load("res://Battle/Art/Party/Stats/Portraits/portrait_%s.png" % BattleActor.PlayerClass.keys()[data.player_class])
			player_position.texture=ResourceLoader.load("res://Battle/Art/Party/Stats/Positions/position_%s_%s.png" % [BattleActor.Row.keys()[data.row], data.pos])
			show()
		else:
			hide()
