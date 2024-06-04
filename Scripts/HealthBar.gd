extends ProgressBar

var player

func set_player(p):
	player = p
	player.healthChanged.connect(update)
	update()


func update():
	value = player.currentHealth
	pass
