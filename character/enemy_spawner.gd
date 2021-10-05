extends Node2D

var spawn_positions=null

var Enemy=preload("res://character/enemy.tscn")

func _ready():
	$SpawnTimer.start()
	$SpawnTimer.connect("timeout", self, "_on_SpawnTimer_timeout")
	print("STARTED")
	randomize()
	spawn_positions=$spawn_positions.get_children()

func spawn_enemy():
	var index=randi() % spawn_positions.size()
	var enemy=Enemy.instance()
	enemy.global_position=spawn_positions[index].global_position
	add_child(enemy)
	
func _on_SpawnTimer_timeout():
	print("RUN")
	spawn_enemy()
