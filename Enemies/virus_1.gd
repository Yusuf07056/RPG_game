extends KinematicBody2D

var knockback = Vector2.ZERO
onready var Enemy_stats = $enemy_stat

func _ready():
	print(Enemy_stats.healt_point)
	print(Enemy_stats.healt)

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 100*delta)
	knockback = move_and_slide(knockback)

func _on_hurt_box_area_entered(area):
	Enemy_stats.healt -=1
	knockback = area.knockback_vector * 110

func _on_enemy_stat_death():
	queue_free()
