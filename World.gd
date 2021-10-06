extends Node2D

var score=0
var laser=preload("res://character/laser.tscn")
var Player=preload("res://character/player.tscn")
var p=Player.instance()


func _ready():
	p.connect('spawn_laser',self,'_on_player_spawn_laser')
	p.connect('update_health',self,'_on_player_update_health')
	add_child(p)
	$Score.text="SCORE : "+str(score)
	$Health.text="HEALTH : "+str(p.health)
	
func _on_player_spawn_laser(location):
	var l= laser.instance()
	l.global_position=location
	l.connect("increase_points", self, "_update_score")
	add_child(l)

func _update_score():
	score+=10
	$Score.text="SCORE : "+str(score)
	print("OK")


func _on_player_update_health(health):
	$Health.text="HEALTH : "+str(health)


func _on_enemy_spawner_reduce_health(delta_health):
	if p!=null:
		p.reduce_health(delta_health)
		$Health.text="HEALTH : "+str(p.health)
	
