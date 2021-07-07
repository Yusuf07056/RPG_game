extends Area2D



func _on_Area2D_body_entered(body):
	$AnimationTree.play("item")
	queue_free()
