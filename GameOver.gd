extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_tree().paused = true
	show()


func _on_restart_pressed():
	hide()
	get_tree().change_scene_to_file("res://Scenes/InBattle.tscn")
	hide()

func _on_rage_pressed():
	get_tree().quit()
