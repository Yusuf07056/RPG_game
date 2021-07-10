extends Area2D




func _on_obat_body_entered(body):
	$AnimationPlayer.play("obat")
	body.count_obat()


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
