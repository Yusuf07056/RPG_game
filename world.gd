extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var enemy = $character/virus_1/virus 
var musuh = enemy setget set_enemy
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func set_enemy(value):
	musuh = value
	if musuh <= 0 :
		get_tree().change_scene("res://GAMEOVERSCREEN.tscn")
