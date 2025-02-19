extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func coinGet():
	pass

func _on_body_entered(body):
	print ("hi")
	if body.name == "BottomCliff" or "TopBed":
		queue_free()
