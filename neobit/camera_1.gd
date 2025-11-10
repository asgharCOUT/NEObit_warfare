extends Camera2D
func _process(delta: float) -> void:
	if Input.is_action_pressed("a"):
		global_position.x -= 10
	
	if Input.is_action_pressed("d"):
		global_position.x += 10
	if Input.is_action_pressed("w"):
		global_position.y -= 10
	if Input.is_action_pressed("s"):
		global_position.y += 10
	#if Input.is_action_just_pressed("upscroll"):
	#	zoom += Vector2(0.2,0.2)
	#if Input.is_action_just_pressed("downscroll"):
	#	if zoom.x > 0.5 and zoom.y > 0.5:
	#s		zoom -= Vector2(0.2,0.2)
