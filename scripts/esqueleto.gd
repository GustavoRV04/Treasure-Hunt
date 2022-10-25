extends KinematicBody2D
var vel = 250
var dir = Vector2.ZERO
var move = 0
var knockback_dir = 1
var knockback_int = 450
const grav = 2350
var tempo = 0
class_name  enemy

func _ready():
	Global.vida_e = 2
	
	pass

func _process(delta):
	move = -1
	tempo += 1 * delta
	
	


		
	if Global.vida_e <= 0:
		$AnimatedSprite.play("dead")
		
	pass
func _physics_process(delta):
	dir.y += grav * delta

	if $ray_wall.is_colliding():
		$AnimatedSprite.flip_h = false
		move == 1
		dir.x =+ 300
		knockback_dir =+ 1
		$AnimatedSprite.play("walk")
		
	if $ray_wall2.is_colliding():
		$AnimatedSprite.flip_h = true
		move == -1
		dir.x =- 300
		knockback_dir =- 1
		$AnimatedSprite.play("walk")
	

	if $AnimatedSprite.flip_h == true:
		move == -1
		dir.x =- 300
		$AnimatedSprite.play("walk")
		
	if $AnimatedSprite.flip_h == false:	
		move == 1
		dir.x =+ 300

	
	
	

	dir = move_and_slide(dir)



func knockback():
	dir.x = -knockback_dir * knockback_int
	dir = move_and_slide(dir)

func _on_react_area_entered(area):
#	print(area.name)
#	if area.name == "espada" or "espada2":
#		Global.vida_e -= 1
	pass # Replace with function body.


func _on_esqueleto_area_entered(area):
	print(area.name)
	if area.name == "arrow":		
		$AnimatedSprite.play("hit")
		knockback()
		
	elif area.name == "espada":
		$AnimatedSprite.play("hit")
		knockback()
		
	elif area.name == "espada2":
		$AnimatedSprite.play("hit")
		knockback()
		
		
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	var anim_name = $AnimatedSprite.animation
	if anim_name == "dead":
		queue_free()
	pass # Replace with function body.
