extends Node

var party: Array = [
	preload("res://Battle/Party/Player1.tres"),
	preload("res://Battle/Party/Player2.tres"),
	#preload("res://Battle/Party/Player3.tres"),
	#preload("res://Battle/Party/Player4.tres"),
	]

# TODO still need learn how enemy configurations are set

var enemies: Array = [
	preload("res://Battle/Enemies/snarl_bat1.tres"),
	preload("res://Battle/Enemies/snarl_bat2.tres")
]

func _ready() -> void:
	for player in party:
		player.init()
	# TODO This can't be how we will eventually do it but leave it for now
	for enemy in enemies:
		enemy.init()
