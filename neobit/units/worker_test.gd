extends CharacterBody2D
var dir
@export var Health : int = 100
@export var speed:int = 100
var have_target:bool = false

@export var max_caring_ress : int = 10
var caring_ress: int = 0
var target_is_building : bool 
var ress_target
var target

var base_building :String
func _physics_process(delta: float) -> void:
	#print(caring_ress)
	if caring_ress <= 0:
		target = get_tree().get_first_node_in_group("clay")
		target_is_building = false
	else:
			target = get_tree().get_first_node_in_group(base_building)
			target_is_building = true
	
	if target:
		
		$"hit box".look_at(target.global_position)
		if target_is_building:
			if target.get_parent().building == false:
				global_position = global_position.move_toward(target.global_position,delta * speed)
			else:
				pass
		else:
			global_position = global_position.move_toward(target.global_position,delta * speed)
	
	
		
	
	
	
func attack():
	pass
func finding_building():
	target = get_tree().get_first_node_in_group(base_building)
	if !target == null:
		pass


#func _on_button_pressed() -> void:
	#tarress = get_tree().get_nodes_in_group("clay")
	#if !tarress == []:
		#ress_target = tarress[0]
	#print("but pressed")
	#finding_building()
	#print(tarress)


func _on_hit_box_area_entered(area: Area2D) -> void:
	print("detect house")
	if area.is_in_group("ress"):
		area.get_parent().amount -= 10
		caring_ress += 10
	if area.is_in_group(base_building) and area.get_parent().building == false:
		caring_ress -= 10
		area.get_parent().clay += 10
		area.get_parent().clay_recived()




func _on_hit_box_area_exited(area: Area2D) -> void:
	pass
