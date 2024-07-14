extends CharacterBody2D

var hp = 100
var earlier_speed = 60
@export var speed = earlier_speed
@export var Bullet : PackedScene

func _ready():
	print(hp)
	
func _process(delta):
	if hp == 0:
		get_tree().paused = true

func shoot():
	print("bang")
	var b = Bullet.instantiate()
	add_child(b)
	b.transform = $Muzzle.transform

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func _input(event):
	if event.is_action_pressed("Sprint"):
		earlier_speed = speed
		speed = 120
	elif event.is_action_released("Sprint"):
		speed = earlier_speed

	if event.is_action_pressed("Enter"):
		hp -= 20
		print(hp)
		$"../Hurt".play()

	if Input.is_action_just_pressed("Shoot"):
		shoot()
