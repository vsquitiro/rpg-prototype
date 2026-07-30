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

func run() -> void:
	# TODO still need to order entries in another function
	if !events.size():
		return
	var event: Dictionary = events.pop_front()
	
	print("Running event: ", event.actor.name, " ", COMMAND.keys()[event.command], " ", event.target.name)
	
	match event.command:
		COMMAND.ATTACK:
			# TODO we need to make sure the actor is still in a state to continue this actions
			if event.actor is BattleActorPlayer:
				await(event.actor.attack())
				event.target.take_damage(event.actor.weapon.instant_sprite)
			else:
				event.target.take_damage(null)
			print('event queue calls for heal_hurt')
			await(get_tree().create_timer(0.2).timeout)
			event.target.heal_hurt(-1)
	
	await(get_tree().create_timer(0.5).timeout)
	await run()
