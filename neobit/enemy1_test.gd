extends CharacterBody2D
@export var health: int = 100
@export var damage:int = 10
@export var speed : int = 1
var target
var main_target
var nav_point
func _ready() -> void:
	main_target = get_tree().get_first_node_in_group("maintown")
	target = main_target
	get_parent().enemys += 1
	make_path()

func make_path():
	$nav.target_position = target.global_position


func _process(delta: float) -> void:
	if temp_tar == []:
		
		target = main_target
		make_path()
	if $nav.target_position != target.global_position:
		make_path()
	
	
	
	if !$nav.is_target_reached():
		nav_point = to_local($nav.get_next_path_position()).normalized()
		global_position = global_position + nav_point * speed * delta
	

var temp_tar:Array
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("BLUE"):
		temp_tar.append(area)
		
		target = temp_tar[0]
		make_path()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("BLUE"):
		
		temp_tar.erase(area)
		
