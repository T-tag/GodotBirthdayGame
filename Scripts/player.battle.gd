extends CharacterBody2D


var hp = 100
var earlier_speed = 60
@export var speed = earlier_speed
@export var Bullet : PackedScene

func _ready():
	get_tree().paused = false
	print(hp)
	
func _process(delta):
	if hp == 0:
		$"../GameOver".show()
		get_tree().paused = true

func shoot():
	print("bang")
	var b = Bullet.instantiate()
	get_parent().add_child(b)
	b.transform = $Muzzle.global_transform
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func _input(event):
	
	
		# Get movement input
	velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down") - Input.get_action_strength("up")
  
	if velocity != Vector2.ZERO:
		rotation = velocity.angle()
	
	# Print the current rotation of the character in radians
	print("Current rotation (radians): ", rotation)
	print("Current rotation (degrees): ", rad_to_deg(rotation))
	
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
