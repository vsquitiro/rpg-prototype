class_name PlayerStats extends Control

@onready var _portrait: TextureRect = $StatBlock/Graphics/Portrait
@onready var _player_position: TextureRect = $StatBlock/Graphics/PlayerPosition
@onready var _player_name: Label = $StatBlock/PlayerName
@onready var _hp: Label = $StatBlock/Health/HP
@onready var _hp_max: Label = $StatBlock/Health/HPMax
@onready var _active_player_window: NinePatchRect = $ActivePlayerWindow

var data: BattleActorPlayer = null:
	set(value):
		data = value
		
		if data:
			data = data.new()
			_player_name.text = data.name
			_hp.text = str(data.hp) + '/'
			_hp_max.text = str(data.hp_max)
			# TODO reassess this method after learning more about GODOT
			_portrait.texture=ResourceLoader.load("res://Battle/Art/Party/Stats/Portraits/portrait_%s.png" % BattleActorPlayer.PlayerClass.keys()[data.player_class])
			_player_position.texture=ResourceLoader.load("res://Battle/Art/Party/Stats/Positions/p_%s.png" % data.pos)
			show()
		else:
			hide()

func toggle_active_window(active: bool):
	_active_player_window.visible = active
