extends RigidBody2D
class_name Player
var speed=500
var health=3
var input_vector=Vector2.ZERO
onready var gun=$gun
signal spawn_laser(location)
signal update_health(health)
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	input_vector.x=Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	#input_vector.y=Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	var new_pos=global_position+input_vector*speed*delta
	global_position.x = clamp(new_pos.x, 0, screen_size.x)
	
	
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()
func reduce_health(delta_health):
	health-=delta_health
	if health<=0:
		queue_free()

func _take_damage(damage):
	reduce_health(damage)
	emit_signal("update_health",health)
	


func _on_player_area_entered(area):
	if area.is_in_group('enemy'):
		area._take_damage(1)
		

func shoot_laser():
	emit_signal("spawn_laser",gun.global_position)
