class_name EnemyButtons extends Menu

@onready var enemies: Array = Data.enemies

func _ready() -> void:
	super._ready()
	
	for i in range(get_child_count()):
		if i < enemies.size():
			get_child(i).data = enemies[i]
		else:
			get_child(i).queue_free()
