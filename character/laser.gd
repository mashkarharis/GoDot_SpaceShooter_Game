extends Area2D


var speed=1000


func _physics_process(delta):
	global_position.y -=speed*delta

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _destroy():
	queue_free()

func _on_laser_area_entered(area):
	if area.is_in_group('enemy'):
		area._take_damage(1)
