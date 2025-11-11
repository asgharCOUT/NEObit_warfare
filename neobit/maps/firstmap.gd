extends Node2D
@onready var simplelayer: TileMapLayer = $Simplelayer
var tile_pos
var tile_center
var clays :int = 0
var storage

func clay_added():
	for i in storage:
		clays = i.get_parent().clay
	


func _process(delta: float) -> void:
	storage = get_tree().get_nodes_in_group("buildings")
	$Label.text = str(clays)
	
	var tile_pos = simplelayer.local_to_map(simplelayer.to_local(get_global_mouse_position()))
	if Input.is_action_just_pressed("rightcc"):
		print(tile_pos)
		
	tile_center = simplelayer.map_to_local(tile_pos)
	
