extends Area2D

export (int) var speed=500
var health=1
signal reduce_health(delta_health)


func _physics_process(delta):
	global_position.y+=speed*delta
	
	
func _take_damage(damage):
	health-=damage
	if health<=0:
		queue_free()




func _on_enemy_area_entered(area):
	if area is Player:
		area._take_damage(1)
	if area.is_in_group('laser'):
		area._destroy()
	if area.is_in_group('barrier'):
		print("IN")
		emit_signal('reduce_health',1)
		queue_free()
		
