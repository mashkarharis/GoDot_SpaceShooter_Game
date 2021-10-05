extends Node2D


var laser=preload("res://character/laser.tscn")


func _on_player_spawn_laser(location):
	var l= laser.instance()
	l.global_position=location
	add_child(l)
	
