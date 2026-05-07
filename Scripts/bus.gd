extends CharacterBody3D

@export var speed = 1
@export var start_delay = 3.0

var moving = false

func _ready():
	await get_tree().create_timer(start_delay).timeout
	moving = true

func _physics_process(delta):
	if moving:
		velocity.y -= speed
		move_and_slide()
