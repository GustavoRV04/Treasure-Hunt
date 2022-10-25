extends Node2D


func _ready():
	pass


func _on_dialogo_3_body_entered(body):
	var novo_dialogo = Dialogic.start("Treasure_Hunt3")
	if body.name == "guerreiro" or body.name == "arqueiro":
		add_child(novo_dialogo)
	pass # Replace with function body.


func _on_dialogo_3_body_exited(body):
	if body.name == "guerreiro" or body.name == "arqueiro":
		get_tree().change_scene("res://cenas/FINAL.tscn")
	pass # Replace with function body.
