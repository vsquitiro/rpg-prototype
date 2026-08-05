@abstract class_name BattleActorButton extends TextureButton

const HIT_TEXT: PackedScene = preload("res://Battle/hit_text.tscn")

@abstract func get_hit_text_offset() -> Vector2

func _on_data_hp_changed(_hp: int, hp_delta) -> void:
	var hit_text: HitText = HIT_TEXT.instantiate()
	add_child(hit_text)
	hit_text.size.x = size.x
	hit_text.set_text(str(abs(hp_delta)))
	
	hit_text.position = get_hit_text_offset()
