extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("animation_finished",self,"on_animation_finished")
	play("Animate")


func on_animation_finished():
	queue_free()
	
