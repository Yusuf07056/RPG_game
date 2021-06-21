extends Node2D


func create_rumput_efek():
	var destroyed = load("res://Effects/destroyed.tscn")
	var Destroyed = destroyed.instance()
	var world =  get_tree().current_scene
	world.add_child(Destroyed)
	Destroyed.global_position = global_position

func _on_hurt_box_area_entered(area):
	create_rumput_efek()
	queue_free()
