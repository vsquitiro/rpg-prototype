class_name EventQueue extends Node

enum COMMAND {
	ATTACK,
	SPELL,
	GUARD,
	SWAP,
	ITEM,
	ESCAPE,
}

var events: Array[Dictionary] = []

func add(command: COMMAND, actor: BattleActor, target: BattleActor ) -> void:
	events.append({ "command": command, "actor": actor, "target": target })
	print("Adding event: ", actor.name, " ", COMMAND.keys()[command], " ", target.name)
	print('Event Queue front: ', events.front())

func run() -> void:
	# TODO not sure about this, seems to be just based on the order in which they went in
	if !events.size():
		return
	var event: Dictionary = events.pop_front()
	
	print("Running event: ", event.actor.name, " ", COMMAND.keys()[event.command], " ", event.target.name)
	
	match event.command:
		COMMAND.ATTACK:
			# TODO we need to make sure the actor is still in a state to continue this actions
			print('event queue calls for heal_hurt')
			event.target.heal_hurt(-1)
	
	await(get_tree().create_timer(0.5).timeout)
	await run()
