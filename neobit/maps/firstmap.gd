extends Node2D
@onready var simplelayer: TileMapLayer = $Simplelayer
var tile_pos
var tile_center
func _process(delta: float) -> void:
	var tile_pos = simplelayer.local_to_map(simplelayer.to_local(get_global_mouse_position()))
	if Input.is_action_just_pressed("rightcc"):
		print(tile_pos)
		
	tile_center = simplelayer.map_to_local(tile_pos)
	

const INFANTRY = preload("res://building/infantry.tscn")
func _on_inst_pressed() -> void:
	var inst = INFANTRY.instantiate()
	
	add_child(inst)
