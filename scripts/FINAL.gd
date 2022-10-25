extends Node2D

onready var transition = get_node("transição/fill")
onready var animation = get_node("transição/fill/animation")

export (int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertival", "Corte Horizontal") var transition_type
export(float, 2.0) var duration = 1.0


func _ready():
	$Timer.start()
	transition.material.set_shader_param("type", transition_type)
	animation.playback_speed = duration
	$musicFx.play()
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene("res://cenas/tela inicial.tscn")

	pass
	
	
