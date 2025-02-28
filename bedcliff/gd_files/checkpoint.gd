extends Area2D

var checkpoint_manager

# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_manager = get_parent().get_parent().get_node("Checkpoints")
	#print("success")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "BottomCliff" or "TopBed":
		print ("checkpoint")
		checkpoint_manager.last_location = $RespawnPoint.global_position
		#print ($RespawnPoint.global_position)
