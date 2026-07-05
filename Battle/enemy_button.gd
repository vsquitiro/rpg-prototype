class_name EnemyButton extends TextureButton

@export var data: BattleActor = null :
	set(value):
		data = value.new()
		# TODO update sprite
	

#func _ready() -> void:
	
	#if data:
		#set_data(data)
