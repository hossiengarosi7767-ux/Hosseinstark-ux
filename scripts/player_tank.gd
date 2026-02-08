extends KinematicBody2D

# Player controls
var speed = 200.0  # movement speed
var velocity = Vector2.ZERO

func _process(delta):
    # Reset velocity
    velocity = Vector2.ZERO

    # Check for input
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1

    # Normalize the velocity to maintain consistent speed in diagonal movement
    velocity = velocity.normalized() * speed

    # Move the player tank
    move_and_slide(velocity)