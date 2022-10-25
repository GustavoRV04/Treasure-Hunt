extends AnimatedSprite


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body.name == "guerreiro" or body.name == "arqueiro":
		queue_free()
	pass # Replace with function body.
