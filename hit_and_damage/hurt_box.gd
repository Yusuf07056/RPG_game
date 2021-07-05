extends Area2D

const hiteffect = preload("res://Effects/hiteffect.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_hurt_box_area_entered(area):
	var effect = hiteffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position
