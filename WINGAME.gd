extends CanvasLayer


# Declare member variables here. Examples:
var obat
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_QUIT_pressed():
	get_tree().quit()


func _on_TOMENU_pressed():
	get_tree().change_scene("res://MENU.tscn")


func _on_NEXT_STAGE_pressed():
	PlayerStat.healt = PlayerStat.healt_point
	get_tree().change_scene("res://world3.tscn")
