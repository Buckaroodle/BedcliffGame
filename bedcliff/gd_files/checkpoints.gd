extends Node2D

var last_location
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("Player")
	last_location = player.global_position
	print (last_location)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
