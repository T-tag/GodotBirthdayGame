extends Node2D

var IsInside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $Music.playing == false:
		$Music.play() 

	if Input.is_action_just_pressed("Space") == true:
		if IsInside == true:
			$TristanTalking.play()
			print("Gutday")
			get_tree().paused = true

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	IsInside = true
	print("entered")


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	IsInside = false


func _on_tristan_talking_finished():
	get_tree().paused = false
