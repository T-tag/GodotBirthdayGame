@tool
extends CharacterBody2D

class_name Mob

# Define common properties
@export var speed: float = 200.0
@export var health: int = 100

# Abstract method to be overridden by subclasses
func _ready():
	if self.get_script() == Mob:
		set_script(null)  # Prevent this script from being used directly
		return

# Common method that can be used or overridden by subclasses
func move():
	print("Mob is moving at speed: ", speed)
	
func kill(amount):
	health -= amount
	print(name, ': ', health)
	
	if (health <= 0):
		return true;

