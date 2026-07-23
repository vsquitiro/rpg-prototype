class_name BattleActorEnemy extends BattleActor

const BACK_ROW_START_INDEX: int = 4

@export var sprite : Texture = null

@export var tp_max = 100

var tp: int = tp_max

func update_row():
	# TODO this is simpliefied for now, only factoring in small enemy size
	row = BattleActor.ROW.FRONT if pos < BACK_ROW_START_INDEX else BattleActor.ROW.BACK

func init() -> void:
	hp = hp_max
	tp = tp_max
	update_row()
