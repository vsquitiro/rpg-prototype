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
	
	if event.actor.hp == 0:
		await run()
		return
	
	# TODO set up target if og target is defeated
	
	match event.command:
		COMMAND.ATTACK:
			# TODO we need to make sure the actor is still in a state to continue this actions
			await(event.actor.attack())
			if event.actor is BattleActorPlayer and event.target is BattleActorEnemy:
				event.target.take_damage(event.actor.weapon.instant_sprite)
			else:
				event.target.take_damage(null)
			await(get_tree().create_timer(Timers.HP_FLASH_DELAY).timeout)
			event.target.heal_hurt(-4)
	
	
	await(get_tree().create_timer(Timers.BASIC_TURN).timeout)
	
	if event.target.hp <= 0:
		event.target.ko()
		await(get_tree().create_timer(Timers.ENEMY_KO).timeout)
	
	await run()
