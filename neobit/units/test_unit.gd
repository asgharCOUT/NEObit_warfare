extends CharacterBody2D
var dir
@export var Health : int = 100
@export var speed:int = 100
var have_target:bool = false
var canmove: bool = false


var target
func _physics_process(delta: float) -> void:
	
	
	
	if target and canmove:
		
		$"hit box".look_at(target.global_position)
		
		
		global_position = global_position.move_toward(target.global_position,delta * speed)
		
	
	
		
	move_and_slide()
	
	
func attack():
	pass
func finding_building():
	target = get_tree().get_first_node_in_group("buildings")
	if !target == null:
		canmove = true

func _on_button_pressed() -> void:
	
	print("but pressed")
	finding_building()


func _on_hit_box_area_entered(area: Area2D) -> void:
	print("detect house")
	if area.is_in_group("buildings") and area.get_parent().building == false:
		canmove = false
		area.get_parent().health -= 100
		


func _on_hit_box_area_exited(area: Area2D) -> void:
	canmove = true
