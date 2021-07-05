extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var nyawa_full = $heartUIfull
#onready var label = $Label
onready var nyawa_kosong = $heartUIempty

func set_hearts(value):
	hearts = clamp(value,0, max_hearts)
	#if label != null:
	#	label.text = str(hearts)
	if nyawa_full != null:
		nyawa_full.rect_size.x = hearts * 15
		
func set_max_hearts(value):
	max_hearts = max(value,1)
	self.hearts  = min(hearts,max_hearts)
	if nyawa_kosong != null:
		nyawa_kosong.rect_size.x = max_hearts * 15
	
func _ready():
	self.max_hearts = PlayerStat.healt_point
	self.hearts = PlayerStat.healt
	PlayerStat.connect("healt_change", self, "set_hearts")
	PlayerStat.connect("max_healt_change", self, "set_max_hearts")
	if nyawa_kosong == null:
		get_tree().change_scene("res://GAMEOVERSCREEN.tscn")
