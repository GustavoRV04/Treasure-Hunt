extends Area2D

const SPEED := 700

var velocity := Vector2.ZERO
var move := 1

func _ready():
	pass
	
func set_direction(dir):
	move = dir	
	if move == 1:
		$anim.flip_h = false
	else:
		$anim.flip_h = true
	
	
func _physics_process(delta):
	velocity.x = SPEED * delta * move
	translate(velocity)


func _on_arrow_body_entered(body):
	queue_free()
	pass # Replace with function body.


func _on_arrow_area_entered(area):
	if area.name == "esqueleto":
		Global.vida_e -=1
		queue_free()
		
	elif area.name == "mago":
		Global.vida_m -=1
		queue_free()
	pass # Replace with function body.
