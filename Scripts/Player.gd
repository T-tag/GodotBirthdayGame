extends CharacterBody2D
var earlier_speed = 60
@export var speed = earlier_speed

@export var maxHealth = 100
var currentHealth = 50

signal healthChanged

func _ready():
	# Set Player in healthBar object
	Hud.get_node("HealthBar").set_player(self)



# --- Input and movement

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



# ---- Collision with enemy

func _on_test_enemy_body_entered(body):
	speed = 0
	TransitionScreen.transition()

	# NOTE: Take 10 damage (just as an example)
	currentHealth -= 10
	healthChanged.emit()

	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/InBattle.tscn")

	

# ----
