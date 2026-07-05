class_name EventQueue extends Node

enum Commands {
	ATTACK,
	SPELL,
	GUARD,
	SWAP,
	ITEM,
	ESCAPE,
}

var events: Array[Dictionary] = []

func add(command: Commands, actor: BattleActor, target: BattleActor ) -> void:
	events.append({ "command": command, "actor": actor, "target": target })
	print("Adding event: ", actor.name, " ", Commands.keys()[command], " ", target.name)
