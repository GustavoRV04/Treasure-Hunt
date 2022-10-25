extends KinematicBody2D
var vel = 340
var dir = Vector2.ZERO
var knockback_dir = 1
var knockback_int = 450
var light = 0

const pulo = -850
const grav = 2350
const cima = Vector2(0,-1)

func _ready():
#	$Sprite/espada2.monitorable = false
#	$Sprite/espada.monitorable = false
	Global.set("player", self)
	Global.vida_g = 5
	$Sprite.visible = true
	$AnimatedSprite.visible = false
	position.x = Global.checkpoint_pos
	pass
	
func _process(delta):
	if Global.vida_g == 5:
		$vidas_g.visible = false
	
	if Global.vida_g < 5:
		$vidas_g.visible = true
	
	if Global.vida_g == 4:
		$vidas_g.visible = true
		$vidas_g.play("4")
		
	if Global.vida_g == 3:
		$vidas_g.visible = true
		$vidas_g.play("3")
		
	if Global.vida_g == 2:
		$vidas_g.visible = true
		$vidas_g.play("2")
		
	if Global.vida_g == 1:
		$vidas_g.visible = true
		$vidas_g.play("1")
		
	if Global.vida_g <= 0:
		get_tree().reload_current_scene()
	
	pass

func _physics_process(delta):
	dir.y += grav * delta
	
	for plataforms in get_slide_count():
		var collision = get_slide_collision(plataforms)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision, self)
	
	if is_on_floor():

		if Input.is_action_pressed("direita"):
			dir.x = vel
			$Sprite.flip_h = false
			$Sprite.play("mov_d")
			knockback_dir =+ 1

		elif Input.is_action_pressed("esquerda"):
			dir.x =- vel
			$Sprite.flip_h = true
			$Sprite.play("mov_d")
			knockback_dir =- 1
			

		elif Input.is_action_pressed("ataque"):
			$Sprite.play("ataque")
			$attackfx.playing = true
			$Sprite/espada2.monitoring = true
			$Sprite/espada.monitoring = true
			$Sprite/espada2.monitorable = true
			$Sprite/espada.monitorable = true		
			
			
		else:
			dir.x = 0
			$Sprite.play("idle")
			$Sprite/espada2.monitoring = false
			$Sprite/espada.monitoring = false
			$Sprite/espada2.monitorable = false
			$Sprite/espada.monitorable = false		



		if Input.is_action_pressed("cima"):
			dir.y = pulo
			$Sprite.play("jump")
			$jumpFx.play()



		
	dir = move_and_slide(dir,cima)

func knockback():
	dir.x = -knockback_dir * knockback_int
	dir = move_and_slide(dir)

func _on_Area2D_area_entered(area):
	if area.name == "esqueleto":
		Global.vida_g -= 1
		$Sprite.play("hit")
		$hurtFx.play()
		knockback()
	if area.name == "espinho":
		Global.vida_g -= 1
		$Sprite.play("hit")
		$hurtFx.play()
		knockback()
	if area.name == "spell":
#		Global.vida_g -= 1
		$Sprite.play("hit") 
		$hurtFx.play()
		knockback()
		

	pass # Replace with function body.



func _on_espada_area_entered(area):
	if area.name == "esqueleto":
		Global.vida_e -=1
		
	elif area.name == "mago":
		Global.vida_m -=1
		
	pass # Replace with function body.


func _on_espada2_area_entered(area):
	if area.name == "esqueleto":
		Global.vida_e -=1
		
	elif area.name == "mago":
		Global.vida_m -=1
	pass # Replace with function body.


func hit_checkpoint():
	Global.checkpoint_pos = position.x



func _on_Sprite_animation_finished():
	pass # Replace with function body.
