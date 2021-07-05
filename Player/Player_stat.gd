extends Node

export(int) var healt_point = 3 setget set_max_healt
var healt = healt_point setget set_healt

signal death
signal healt_change(value)
signal max_healt_change(value)

func set_max_healt(value):
	healt_point = value
	self.healt = min(healt, healt_point)
	emit_signal("max_healt_change")

func set_healt(value):
	healt = value
	emit_signal("healt_change", healt)
	if healt <= 0 :
		emit_signal("death")
		get_tree().change_scene("res://GAMEOVERSCREEN.tscn")
func _ready():
	self.healt = healt_point
