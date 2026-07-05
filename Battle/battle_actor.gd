class_name BattleActor extends Resource

# TODO currently players and enemies are both "battle actors"
# we may want to differentiate

# TODO Player Only
enum PlayerClass {
	KNIGHT,
	FIGHTER,
	MAGE,
	HEALER
}

# TODO very naive approach to position, may switch to index
enum Row {
	FRONT,
	BACK
}

@export var row: Row = Row.FRONT
@export var pos: int = 1
# TODO End section on position 

@export var name: String = ""
@export var hp_max: int = 1

# TODO Enemy Only
@export var tp_max = 100

# TODO Player Only
@export var player_class: PlayerClass = PlayerClass.KNIGHT

var hp: int = hp_max
var tp: int = tp_max

func init() -> void:
	hp = hp_max
	tp = tp_max

func new() -> BattleActor:
	var dup: BattleActor = duplicate()
	dup.init()
	return dup
	
