extends CharacterBody2D
var dir
@export var Health : int = 100
var max_speed : float = 100
var caring_speed:float = 50
var gadering : bool = false
var speed:float = 0
var have_target:bool = false
var ID: int
@export var max_caring_ress : int = 10
var caring_ress: int = 0
var target_is_building : bool 
var ress_target
var target
var diraction : Vector2
var base_building 
var buildings :Array
func _ready() -> void:
	
	target = ress_target
	speed = max_speed
	buildings = get_tree().get_nodes_in_group("clay_building")
	for bb in buildings:
		if bb.get_parent().ID == ID:
			base_building = bb
			
		else:
			pass
	#make_path()
func _physics_process(delta: float) -> void:
	#print(delta)
	#------------------------animation------------------#
	if caring_ress > 0 and !gadering:
		$Sprite2D.play("caring")
		speed = caring_speed
	elif caring_ress <=0 and !gadering:
		$Sprite2D.play("run")
		speed = max_speed
	if gadering:
		$Sprite2D.play("gadering")
	
	
	
	
	
	
	#if caring_ress <= 0:
		#target = get_tree().get_first_node_in_group("clay")
		#target_is_building = false
	#else:
			##target = get_tree().get_first_node_in_group(base_building)
			#target= base_building
			#target_is_building = true
	
	if target:
		diraction = (target.global_position - global_position).normalized()
		if diraction.x >= 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
		$"hit box".look_at(target.global_position)
		#--------------------------moving funcs------------------------------#
		
		if target_is_building:
			if target.get_parent().building == false and gadering == false:
				#----------------moving to building---------------------
				#$NavigationAgent2D.target_position = target.global_position
				#if !$NavigationAgent2D.is_target_reached():
					#var nav_point = to_local($NavigationAgent2D.get_next_path_position()).normalized()
					#global_position = global_position + nav_point * speed * delta
					global_position = global_position.move_toward(target.global_position,speed * delta)
					
				
			else:
				pass
		else:#-----------------------movin to ress
			if target:#$NavigationAgent2D.target_position = target.global_position
				#if !$NavigationAgent2D.is_target_reached():
					#var nav_point = to_local($NavigationAgent2D.get_next_path_position()).normalized()
					#global_position = global_position + nav_point * speed * delta
					#velocity = nav_point * speed
					global_position = global_position.move_toward(target.global_position,speed * delta)

func attack():
	pass
func finding_building():
	target = get_tree().get_first_node_in_group(base_building)
	if !target == null:
		pass
#func make_path():
	#
	#$NavigationAgent2D.target_position = target.global_position
	



func _on_hit_box_area_entered(area: Area2D) -> void:
	#print("detect house")
	if area.is_in_group("ress") and caring_ress <= 0:
		gadering = true
		await get_tree().create_timer(3).timeout
		#if area:
			
		caring_ress += 10
		target = base_building
		#make_path()
		target_is_building = true
		gadering = false
		#else:
			#target = get_tree().get_first_node_in_group("clay")
		#target = ress_target
	if area.is_in_group("clay_building") and area.get_parent().building == false and caring_ress > 0:
		
		
		caring_ress -= 10
		area.get_parent().clay += 10
		area.get_parent().clay_recived()
		target = ress_target
		target_is_building = false
		#make_path()
		




func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	
	$Sprite2D.visible = true
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$Sprite2D.visible = false


func _on_timer_timeout() -> void:
	pass # Replace with function body.
