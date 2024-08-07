extends Area2D
class_name Bullet

var speed = 120

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	if body.is_in_group("Mobs"):
		if (body.kill(10)):
			body.queue_free()
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
