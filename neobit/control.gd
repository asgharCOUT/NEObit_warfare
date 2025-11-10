extends Control
const INFANTRY = preload("res://building/infantry.tscn")

func _on_infantryhouse_pressed() -> void:
	var inst = INFANTRY.instantiate()
	get_parent().get_parent().add_child(inst)
