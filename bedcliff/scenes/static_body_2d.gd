extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print ("sfx made")
	await get_tree().create_timer(.78).timeout
	queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
