extends Node2D
@export var health:int = 100
var building :bool = true
var ID :int
var info_view : bool = false
var clay:int =0
var inf_position: Vector2i


var placed:bool = false
var can_be_build: bool=true
func _ready() -> void:
	ID = randi_range(0,10000)
	can_be_build =false



var clay_list:Array




func _process(delta: float) -> void:
	if can_be_build:
		
		pass
	else:
		pass
	
	
	
	
	if building:
		global_position = get_parent().tile_center
		if can_be_build and Input.is_action_just_pressed("leftcc"):
			inf_position = get_parent().tile_center
			building = false
	else:
		global_position = inf_position
		
		
		#-----------------------------------info view-------------------------------#
	if !building:
		if !info_view:
			$info.visible = false
		else:
			$info.visible = true
	if health <= 0:
		queue_free()
	







func _on_view_info_pressed() -> void:
	
	
	
	if !building:
		if info_view == false:
			var buildings = get_tree().get_nodes_in_group("buildings")
			for offbb in buildings:
				offbb.get_parent().info_view = false
			info_view = true
			
		else:
			
			info_view = false
	
func clay_recived():
	get_parent().clay_added()

func _on_sell_pressed() -> void:
	var our_units = get_tree().get_nodes_in_group("unit")
	for un in our_units:
		if un.get_parent().ID == ID:
			un.get_parent().queue_free()
		else:
			pass
	
	
	get_parent().clays-= clay
	queue_free()


#func _on_hurtbox_body_entered(body: Node2D) -> void:
	#can_be_build = false
	


#func _on_hurtbox_body_exited(body: Node2D) -> void:
	#can_be_build = true
	

const WORKER_TEST = preload("res://units/worker_test.tscn")
func _on_button_pressed() -> void:
	var inst = WORKER_TEST.instantiate()
	inst.ID = ID
	inst.global_position = $info/Button.global_position + Vector2(10,0)
	inst.base_building = "clay_building"
	inst.ress_target = clay_list[0]
	get_parent().get_parent().add_child(inst)


func _on_choos_area_entered(area: Area2D) -> void:
	if area.is_in_group("clay"):
		clay_list.append(area)
		print("appended")
		can_be_build = true


func _on_choos_area_exited(area: Area2D) -> void:
	if area.is_in_group("clay") :
		clay_list.erase(area)
		print("erased")
		can_be_build = false
