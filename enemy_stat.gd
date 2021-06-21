extends Node

export(int) var healt_point = 3
onready var healt = healt_point setget set_healt

signal death

func set_healt(value):
	healt = value
	if healt <= 0 :
		emit_signal("death")
