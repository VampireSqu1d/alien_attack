extends Area2D

class_name Enemy

signal died

@export var speed: int  = 400


func  _physics_process(delta):
	global_position.x -= speed * delta


func die():
	died.emit()
	queue_free()


func _on_body_entered(body):
	body.take_damage()
	die()
