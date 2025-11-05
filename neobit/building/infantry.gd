extends Node2D
@export var health:int = 100
var building :bool = true

var info_view : bool = false

var inf_position: Vector2i
var placed:bool = false


func _process(delta: float) -> void:
	if building:
		global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("leftcc"):
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
		 







func _on_view_info_pressed() -> void:
	if !building:
		if info_view == false:
			var buildings = get_tree().get_nodes_in_group("buildings")
			for offbb in buildings:
				offbb.info_view = false
			info_view = true
			
		else:
			
			info_view = false
	


func _on_sell_pressed() -> void:
	queue_free()
