@abstract class_name BattleActor extends Resource

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
	
