extends Area2D

export(float) var speed := 50.0
onready var animation_player := $AnimationPlayer
onready var sprite := $Sprite
var moving: bool = false

func _process(delta: float): 
	
	moving = false
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		move(speed, 0, delta)
	if Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		move(-speed, 0, delta)
	if Input.is_action_pressed("ui_up"):
		move(0, -speed, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, speed, delta)
		
	if moving:
		animation_player.play("Run")
	else:
		animation_player.play("Idle")
		

func move(x_speed: float, y_speed: float, delta: float) -> void:
	position.x += x_speed * delta
	position.y += y_speed * delta
	moving = true


func _on_Pig_area_entered(area: Area2D):
	area.queue_free()
	scale.x *= 1.1
	scale.y *= 1.1
