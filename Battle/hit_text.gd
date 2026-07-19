class_name HitText extends Label

const SPEED: float = 0.5

func _process(_delta: float) -> void:
	position.y -= SPEED

func _on_free_timeout() -> void:
	queue_free()
