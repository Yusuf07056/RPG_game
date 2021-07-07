extends KinematicBody2D

export var accel = 300
export var max_speed = 50
export var friction = 200

enum{
	IDLE,
	WANDER,
	CHASE
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO
onready var sprite = $virus
onready var Enemy_stats = $enemy_stat
onready var playerdetectzone = $playerdetectzone

var state = CHASE
func _ready():
	print(Enemy_stats.healt_point)
	print(Enemy_stats.healt)

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 100*delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			seek_player()
			
		WANDER:
			pass
				
		CHASE:
			var Player = playerdetectzone.Player
			if Player != null:
				var direksi = (Player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direksi * max_speed, accel * delta)
			else:
				state = IDLE
			sprite.flip_h = velocity.x < 0
			
	velocity = move_and_slide(velocity)

func seek_player():
	if playerdetectzone.can_see_player():
		state = CHASE

func _on_hurt_box_area_entered(area):
	Enemy_stats.healt -=1
	knockback = area.knockback_vector * 90


func _on_enemy_stat_death():
	queue_free()

