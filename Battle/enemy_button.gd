class_name EnemyButton extends TextureButton

@export var data: BattleActorEnemy = null :
	set(value):
		print('we are setting the value:', value)
		data = value.new()
		# TODO update sprite
	

#func _ready() -> void:
	
	#if data:
		#set_data(data)
