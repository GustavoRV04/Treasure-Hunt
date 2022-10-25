extends Area2D





func _on_queda_body_entered(body):
	print(body.name)
	if body.name == "guerreiro" or body.name == "arqueiro":  
		get_tree().reload_current_scene()
#	Global.vida_g = 5
	pass # Replace with function body.
