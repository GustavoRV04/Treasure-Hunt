extends Control


var espada = "res://cenas/guerreiro.tscn"
var arco = "res://cenas/arqueiro.tscn"
onready var transition = get_node("transição/fill")
onready var animation = get_node("transição/fill/animation")

export (int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertival", "Corte Horizontal") var transition_type
export(float, 2.0) var duration = 1.0

func _ready():
	pass

func goToScene():
	get_tree().change_scene("res://cenas/Node2D.tscn")

func _on_guerreiro_pressed():
	Global.playerDir = espada
	goToScene()
	pass # Replace with function body.


func _on_arqueiro_pressed():
	Global.playerDir = arco
	goToScene()
	pass # Replace with function body.
