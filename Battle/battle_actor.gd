@abstract class_name BattleActor extends Resource

signal hp_changed(hp, hp_max, hp_delta)

enum Row {
	FRONT,
	BACK
}

@export var row: Row = Row.FRONT
@export var pos: int = 1

@export var name: String = ""
@export var hp_max: int = 1

var hp: int = hp_max

func init() -> void:
	hp = hp_max

@abstract func update_row()

func new() -> BattleActor:
	var dup: BattleActor = duplicate()
	dup.init()
	return dup

func heal_hurt(value: int) -> void:
	print('heal_hurt called:', value)
	var previous_hp: int = hp
	hp += value
	
	hp = clampi(hp, 0, hp_max)
	# TODO double check, tutorial factors delta _after_ clamp
	hp_changed.emit(hp, hp_max, value)
	
