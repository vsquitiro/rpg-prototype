class_name HitText extends MarginContainer

@onready var _digits: HBoxContainer = $Digits

# TODO will possibly use sprites instead 

# TODO there must be a simpler way to do this but for now this works

var text_floor: float = INF
var text_floor_set: bool = false
var speed: float = -5
var bounce: bool = true

func _process(_delta: float) -> void:
	if !text_floor_set:
		text_floor = position.y
		text_floor_set = true
	position.y += speed
	if position.y >= text_floor:
		if bounce:
			speed = -3
			bounce = false
			text_floor_set = false
		else:
			speed = 0
	else:
		speed += 0.5
		
		

func _on_free_timeout() -> void:
	queue_free()

func set_text(text: String):
	# TODO so far this is just for damage numbers
	var digit_array = _digits.get_children()
	
	for i: int in range(4):
		if text.length() > i:
			digit_array[i].texture = ResourceLoader.load("res://Battle/Art/HpText/white_large_%s.png" % str(text[i]))
		else:
			digit_array[i].queue_free()
