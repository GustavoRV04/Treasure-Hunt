extends Area2D

var velocity = Vector2.ZERO
var shoot_speed = -300

func _ready():
	pass
	
func _physics_process(delta):
	velocity.x = shoot_speed * delta
	$texture.play("2")
	
	translate(velocity)


func _on_spell_body_entered(body):
	if body.name == "guerreiro" or body.name == "arqueiro":
		queue_free()
	pass # Replace with function body.


func _on_spell_area_entered(area):
#	if area.name == "guerreiro" or area.name == "arqueiro":
#		Global.vida_a -= 1
#		Global.vida_g -= 1
#		queue_free()
	pass # Replace with function body.
