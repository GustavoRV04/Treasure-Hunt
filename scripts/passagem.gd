extends Area2D




 

func _on_passagem_body_entered(body):
	if body.name ==  "guerreiro" or "arqueiro":
		body.hit_checkpoint()
	print(body.name)
		
func goToScene():
	get_tree().change_scene("res://cenas/Fase02.tscn")

