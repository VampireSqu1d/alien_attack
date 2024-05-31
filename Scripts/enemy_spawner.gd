extends Node2D

var enemyScene = preload("res://Scenes/enemy.tscn")
var pathEnemyScene = preload("res://Scenes/enemy_path.tscn")

@onready var spawnPositions = $SpawnPositions

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

func _process(delta):
	pass


func spawn_enemy():
	var enemy = enemyScene.instantiate() as Enemy
	var position = spawnPositions.get_children().pick_random() as Marker2D
	enemy.global_position = position.global_position
	#add_child(enemy)
	emit_signal("enemy_spawned", enemy)


func _on_timer_timeout():
	spawn_enemy()



func _on_path_enemy_timer_timeout():
	spawn_path_enemy()


func spawn_path_enemy():
	var enemy_path = pathEnemyScene.instantiate() as EnemyPath
	emit_signal("path_enemy_spawned", enemy_path)
