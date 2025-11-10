extends Node2D

@export var amount : int = 100
func _ready() -> void:
	add_to_group("clay")
func _process(delta: float) -> void:
	if amount <= 0:
		queue_free()
