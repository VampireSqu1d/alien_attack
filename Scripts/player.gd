extends CharacterBody2D

@export var speed: int = 500

signal took_damage

var rocketScene = preload("res://Scenes/rocket.tscn")

@onready var rocketContainer = %RocketContainer
@onready var rocket_shot_sound = $RocketShotSound

func _ready():
	pass


func _physics_process(_delta):
	
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_down"):
		velocity.y = speed;
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed;
	if Input.is_action_pressed("move_right"):
		velocity.x = speed;
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed;
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	global_position = global_position.clamp(Vector2(0,0), get_viewport_rect().size)
	move_and_slide()


func shoot():
	var rocket_instance = rocketScene.instantiate() as Rocket
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 50 
	rocket_shot_sound.play()
	rocketContainer.add_child(rocket_instance)
	


func take_damage():
	took_damage.emit()


func die():
	queue_free()



