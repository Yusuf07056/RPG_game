extends Camera2D


onready var kiri_atas = $limit/kiri_atas
onready var kanan_bawah = $limit/kanan_bawah


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_top = kiri_atas.position.y
	limit_left = kiri_atas.position.x
	limit_bottom = kanan_bawah.position.y
	limit_right = kanan_bawah.position.x
