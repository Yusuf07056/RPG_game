extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	print(bodies)
	for body in bodies:
		if body.name == "player":
			get_tree().change_scene("res://world.tscn")
			position.angle_to(Vector2.DOWN)
