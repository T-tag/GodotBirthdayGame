extends Mob

func _ready():
	move()  # Call the common move method
	print("This test mob has health: ", health)
