extends Area2D

export(float) var speed := 50.0

func _process(delta): 
	if Input.is_action_pressed("ui_right"):
		move(speed, 0, delta)
	if Input.is_action_pressed("ui_left"):
		move(-speed, 0, delta)
	if Input.is_action_pressed("ui_up"):
		move(0, -speed, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, speed, delta)
		

func move(x_speed: float, y_speed: float, delta: float) -> void:
	position.x += x_speed * delta
	position.y += y_speed * delta
