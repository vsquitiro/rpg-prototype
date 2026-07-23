class_name BattleActorPlayer extends BattleActor

const BACK_ROW_START_INDEX: int = 3

@export var player_class: PlayerClass = null

# TODO this should probably go in some kind of shared player object, as well as the portrait and class
# TODO making this weapon and offhand for now and will determine inheritance in future

@export var weapon: Weapon = null
@export var offhand: Offhand = null

func update_row():
	row = BattleActor.ROW.FRONT if pos < BACK_ROW_START_INDEX else BattleActor.ROW.BACK

func init() -> void:
	hp = hp_max
	update_row()
