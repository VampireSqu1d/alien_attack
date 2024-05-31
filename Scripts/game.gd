extends Node2D

@export var lives: int = 3
var score: int = 0

@onready var player = $Player 
@onready var HUD = $UI/HUD
@onready var enemy_hit_sound = $EnemyHitSound
@onready var take_damage_sound = $TakeDamageSound

var GameOverScene = preload("res://Scenes/game_over.tscn")

func _ready():
	HUD.set_score_label(score)
	HUD.set_lives(lives)


func _on_death_zone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	lives -= 1
	HUD.set_lives(lives)
	take_damage_sound.play()
	if lives <= 0:
		player.die()
		await get_tree().create_timer(1).timeout
		call_game_over()
	else:
		print("remaining lives:" + str(lives))


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	
	add_child(enemy_instance)


func on_enemy_died():
	score += 100
	HUD.set_score_label(score)
	enemy_hit_sound.play()


func call_game_over():
	var game_over = GameOverScene.instantiate()
	game_over.set_score(score)
	$UI.add_child(game_over)


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", on_enemy_died)



