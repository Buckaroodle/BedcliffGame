extends Area2D

@onready var coinSound = $CoinSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func coinGet():
	pass

func _on_body_entered(body):
	if body.name == "BottomCliff" or "TopBed":
		$Coin.visible = not $Coin.visible
		coinSound.play()
		print ("hi")
		await get_tree().create_timer(.78).timeout
		queue_free()
