@abstract class_name BattleActor extends Resource

signal hp_changed(hp, hp_delta)
signal display_damage()

enum ROW {
	FRONT,
	BACK
}

@export var row: ROW = ROW.FRONT
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
	hp += value
	
	hp = clampi(hp, 0, hp_max)
	hp_changed.emit(hp, value)

func take_damage():
	display_damage.emit()
