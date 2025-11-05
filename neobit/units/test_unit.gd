extends CharacterBody2D
var dir
var speed:int = 1
var have_target:bool = false
enum charstat{
	idle,
	attack
	
}

var target
func _physics_process(delta: float) -> void:
	if target:
		
		dir = target.global_position - global_position
		velocity = dir * speed
	
	if target == null:
		velocity = Vector2(0,0)
		
	move_and_slide()




func _on_button_pressed() -> void:
	
	target = get_tree().get_first_node_in_group("buildings")
