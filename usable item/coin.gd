extends Area2D


func _on_Area2D_body_entered(body):
	var bodies = get_overlapping_bodies()
	print(bodies)
	for body in bodies:
		if body.name == "player":
			queue_free()
