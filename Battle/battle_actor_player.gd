class_name BattleActorPlayer extends BattleActor

enum PlayerClass {
	KNIGHT,
	FIGHTER,
	MAGE,
	HEALER
}

const BACK_ROW_START_INDEX: int = 3

@export var player_class: PlayerClass = PlayerClass.KNIGHT

func update_row():
	row = BattleActor.Row.FRONT if pos < BACK_ROW_START_INDEX else BattleActor.Row.BACK

func init() -> void:
	hp = hp_max
	update_row()
