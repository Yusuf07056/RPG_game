extends Node2D

onready var animasi_sprite = $AnimatedSprite
func _ready():
	animasi_sprite.frame = 0
	animasi_sprite.play("efekrumput")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	queue_free()
