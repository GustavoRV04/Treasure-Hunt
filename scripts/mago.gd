extends KinematicBody2D

var facing_left = true

onready var bullet_instance = preload("res://cenas/spell.tscn")
onready var player = Global.get("player")

func _ready():
	$AnimatedSprite.play("idle")
	pass
	
func _physics_process(delta):
	
	if Global.vida_m < 1:
		queue_free()

		
	if player:
		var distance = player.global_position.x - self.position.x
		facing_left = false if distance < 0 else true
	
	if facing_left:
		self.scale.x = 1
	else:
		self.scale.x = -1
		
func shoot():
	var bullet = bullet_instance.instance()
	get_parent().add_child(bullet)
	bullet.global_position = $spawnSpell.global_position


func _on_playerDetector_body_entered(body):
	if body.name == "guerreiro" or body.name == "arqueiro":
		$AnimatedSprite.play("shoot")
		
	else:
		$AnimatedSprite.play("idle")
		
	pass # Replace with function body.


func _on_playerDetector_body_exited(body):
	if body.name == "guerreiro":
		$AnimatedSprite.play("idle")
		
	if body.name == "arqueiro":
		$AnimatedSprite.play("idle")
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	var anim_name = $AnimatedSprite.animation
	if anim_name == "shoot":
		shoot()
	pass # Replace with function body.


func _on_playerDetector_area_entered(area):
	pass # Replace with function body.


func _on_mago_area_entered(area):
	if area.name == "arrow":		
		$AnimatedSprite.play("hit")
		
	elif area.name == "espada":
		$AnimatedSprite.play("hit")
		
	elif area.name == "espada2":
		$AnimatedSprite.play("hit")
	pass # Replace with function body.
