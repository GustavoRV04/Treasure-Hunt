extends KinematicBody2D

onready var timer = $Timer
onready var reset_position = global_position
onready var anim = $anim

var velocity = Vector2.ZERO
var gravity = 2350
var is_triggered = false
export var reset_timer = 3.0

func _ready():
	set_physics_process(false)
	pass

func _physics_process(delta):
	velocity.y += gravity * delta
	position += velocity * delta

func collide_with(collision: KinematicCollision2D, collider: KinematicBody2D):
	if !is_triggered:
		is_triggered = true
		anim.play("shake")
		velocity = Vector2.ZERO


func _on_anim_animation_finished(anim_name):
	set_physics_process(true)
	timer.start(reset_timer)
	pass # Replace with function body.
