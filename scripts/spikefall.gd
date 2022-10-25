extends KinematicBody2D

onready var timer = $Timer
onready var reset_position = global_position
onready var anim = $anim

var velocity = Vector2.ZERO
var gravity = 2350
var is_triggered = false
export var reset_timer = 3.0

func _ready():
	pass


func _on_anim_animation_finished(anim_name):
	pass # Replace with function body.
