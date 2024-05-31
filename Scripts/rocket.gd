extends Area2D

class_name Rocket

@export var rocket_speed : int = 600

func _physics_process(delta):
	global_position.x += rocket_speed *delta


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
	area.die()
