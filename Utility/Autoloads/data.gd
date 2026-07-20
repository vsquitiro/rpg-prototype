extends Node

var party: Array = [
	preload("res://Battle/Party/Player1.tres"),
	#preload("res://Battle/Party/Player2.tres"),
	#preload("res://Battle/Party/Player3.tres"),
	#preload("res://Battle/Party/Player4.tres"),
	]

func _ready() -> void:
	for player in party:
		player.init()
	
