extends Area2D
class_name Player
var speed=300
var health=3
var input_vector=Vector2.ZERO
onready var gun=$gun
signal spawn_laser(location)



func _physics_process(delta):
	input_vector.x=Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	input_vector.y=Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	
	global_position+=input_vector*speed*delta
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()

func _take_damage(damage):
	health-=damage
	if health<=0:
		queue_free()


func _on_player_area_entered(area):
	if area.is_in_group('enemy'):
		area._take_damage(1)

func shoot_laser():
	emit_signal("spawn_laser",gun.global_position)
