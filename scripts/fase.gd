extends Node2D

onready var transition = get_node("transição/fill")
onready var animation = get_node("transição/fill/animation")

export (int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertival", "Corte Horizontal") var transition_type
export(float, 2.0) var duration = 1.0

func _ready():
	Global.cash = 0
	transition.material.set_shader_param("type", transition_type)
	animation.playback_speed = duration
	MusicController.play_music()
	pass
	
func _process(delta):
	
	pass


func _on_dialogo_1_body_entered(body):
	var novo_dialogo = Dialogic.start("Treasure_Hunt1")
	add_child(novo_dialogo)
	
	pass # Replace with function body.


func _on_dialogo_1_body_exited(body):
	$dialogo_1/CollisionShape2D.queue_free()

	pass # Replace with function body.


func _on_dialogo_2_body_entered(body):
	var novo_dialogo = Dialogic.start("Treasure_Hunt2")
	if body.name == "guerreiro" or body.name == "arqueiro":
		add_child(novo_dialogo)
	pass # Replace with function body.





func _on_artefato_body_entered(body):
	pass # Replace with function body.


func _on_artefato_body_exited(body):
	pass # Replace with function body.


func _on_dialogo_2_body_exited(body):
	pass # Replace with function body.


func _on_dialogo_3_body_entered(body):
	var novo_dialogo = Dialogic.start("Treasure_Hunt3")
	if body.name == "guerreiro" or body.name == "arqueiro":
		add_child(novo_dialogo)
	pass # Replace with function body.


func _on_dialogo_3_body_exited(body):
	if body.name == "guerreiro" or body.name == "arqueiro":
		get_tree().change_scene("res://cenas/FINAL.tscn")
	pass # Replace with function body.
