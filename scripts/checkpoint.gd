extends Area2D


func _ready():
	$AnimatedSprite.play("idle")
	pass


func _on_checkpoint_body_entered(body):
	if body.name ==  "guerreiro" or "arqueiro":
		$AnimatedSprite.play("upper")
		body.hit_checkpoint()
		$CollisionShape2D.queue_free()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	var anim_name = $AnimatedSprite.animation
	if anim_name == "upper":
		$AnimatedSprite.play("check")
	pass # Replace with function body.
