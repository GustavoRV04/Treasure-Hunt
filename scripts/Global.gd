extends Node
var vida_g = 5
var vida_a = 4
var vida_e = 2
var vida_m = 2

var playerDir
var playerdir
var player 
var cash = 0

var fase02 = 0

var checkpoint_pos = 0

var guerreiro = false
var arqueiro = false
func _ready():
	pass
	
func instance_node(node, location, parent):
		var node_instance = node.instance()
		parent.add_child(node_instance)
		node_instance.global_position = location
		return node_instance
