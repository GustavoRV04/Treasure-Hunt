extends KinematicBody2D
var vel = 370
var dir = Vector2.ZERO
var knockback_dir = 1
var knockback_int = 450
var light = 0

const pulo = -850
const grav = 2350
const cima = Vector2(0,-1)
const ARROW := preload("res://cenas/arrow.tscn")

func _ready():
	Global.set("player", self)
	Global.vida_a = 4
	position.x = Global.checkpoint_pos
	pass
	
func _process(delta):
	if Global.vida_a == 4:
		$vidas_a.visible = false
	
	if Global.vida_a < 4:
		$vidas_a.visible = true
	
	if Global.vida_a == 3:
		$vidas_a.visible = true
		$vidas_a.play("3")
		
	if Global.vida_a == 2:
		$vidas_a.visible = true
		$vidas_a.play("2")
		
	if Global.vida_a == 1:
		$vidas_a.visible = true
		$vidas_a.play("1")
		
	if Global.vida_a == 0:
		$vidas_a.visible = true
		$vidas_a.play("0")
		
	if Global.vida_a <= 0:
		get_tree().reload_current_scene()

func _physics_process(delta):
	dir.y += grav * delta
	
	for plataforms in get_slide_count():
		var collision = get_slide_collision(plataforms)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision, self)
	
	if is_on_floor():
		
		if Input.is_action_pressed("direita"):
			dir.x = vel
			$Sprite.play("walk")
			knockback_dir =+ 1
			if sign($shoot_point.position.x ) == -1:
				$shoot_point.position.x *= -1
			$Sprite.flip_h = false
			
		elif Input.is_action_pressed("esquerda"):
			dir.x =- vel
			$Sprite.play("walk")
			knockback_dir =- 1
			if sign($shoot_point.position.x ) == 1:
				$shoot_point.position.x *= -1
			$Sprite.flip_h = true
			
		elif Input.is_action_pressed("ataque"):
			$Sprite.play("disparo")
			$attackfx.play()
		
		else:
			dir.x = 0
			$Sprite.play("idle")
	
		if Input.is_action_just_pressed("cima"):
			dir.y = pulo
			$Sprite.play("jump")
			$jumpFx.play()
			

		
	dir = move_and_slide(dir,cima)
	
	if Global.vida_a <= 0:
		get_tree().reload_current_scene()


func knockback():
	dir.x = -knockback_dir * knockback_int
	dir = move_and_slide(dir)
	


func _on_Area2D_area_entered(area):
	if area.name == "esqueleto":
		Global.vida_a -= 1
		$Sprite.play("hit")
		knockback()
	if area.name == "espinho":
		Global.vida_a -= 1
		$Sprite.play("hit")
		knockback()
	if area.name == "spell":
		Global.vida_a -= 1
		$Sprite.play("hit")
		knockback()
		
	if area.name == "dima":
		$coinFx.play()
	pass # Replace with function body.


func _on_Sprite_animation_finished():
	var anim_name = $Sprite.animation
	if anim_name == "disparo":
			var shoot_instance = ARROW.instance()
			if sign($shoot_point.position.x) == 1:
				shoot_instance.set_direction(1)
			else:
				shoot_instance.set_direction(-1)
			get_parent().add_child(shoot_instance)
			shoot_instance.position = $shoot_point.global_position
	pass # Replace with function body.

func hit_checkpoint():
	Global.checkpoint_pos = position.x and position.y
