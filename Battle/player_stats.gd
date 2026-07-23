class_name PlayerStats extends Control

@onready var _portrait: TextureRect = $StatBlock/Graphics/Portrait
@onready var _player_position: TextureRect = $StatBlock/Graphics/PlayerPosition
@onready var _player_name: Label = $StatBlock/PlayerName
@onready var _hp: Label = $StatBlock/Health/HP
@onready var _hp_max: Label = $StatBlock/Health/HPMax
@onready var _active_player_window: NinePatchRect = $ActivePlayerWindow

var data: BattleActorPlayer = null:
	set(value):
		if value:				
			data = value
			data.hp_changed.connect(_on_data_hp_changed)
			_player_name.text = data.name
			_hp.text = str(data.hp) + '/'
			_hp_max.text = str(data.hp_max)
			_portrait.texture=data.player_class.portrait_sprite
			# TODO reassess this method after learning more about GODOT
			_player_position.texture=ResourceLoader.load("res://Art/Party/Stats/Positions/p_%s.png" % data.pos)
			show()
		else:
			hide()

func toggle_active_window(active: bool):
	_active_player_window.visible = active

func _on_data_hp_changed(hp: int, _hp_delta: int) -> void:
	_hp.text = str(hp)
