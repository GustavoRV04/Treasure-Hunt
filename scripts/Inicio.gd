extends Node2D

onready var transition = get_node("transição/fill")
onready var animation = get_node("transição/fill/animation")

export (int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertival", "Corte Horizontal") var transition_type
export(float, 2.0) var duration = 1.0


func _ready():
	transition.material.set_shader_param("type", transition_type)
	animation.playback_speed = duration
	$musicFx.play()
	pass

func _physics_process(delta):
	if Input.is_action_pressed("start"):
		animation.play("transition_in")
		get_tree().change_scene("res://cenas/selectscreen.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://cenas/selectscreen.tscn")
	pass # Replace with function body.
