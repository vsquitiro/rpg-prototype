class_name BattleActorPlayer extends BattleActor

const BACK_ROW_START_INDEX: int = 3

@export var player_class: PlayerClass = null
@export var weapon: Weapon = null
@export var offhand: Offhand = null

func update_row():
	row = BattleActor.ROW.FRONT if pos < BACK_ROW_START_INDEX else BattleActor.ROW.BACK

func init() -> void:
	hp = hp_max
	update_row()
