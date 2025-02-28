extends Area2D

var checkpoint_manager
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_manager = get_parent().get_node("Checkpoints")
	player = get_parent().get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "BottomCliff" or "TopBed":
		print("killed")
		killPlayer()

func killPlayer():
	player.get_child(0).global_position = checkpoint_manager.last_location
	player.get_child(1).global_position = checkpoint_manager.last_location
	
	print(checkpoint_manager.last_location)
	#player.position = checkpoint_manager.last_location
	
