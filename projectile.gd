extends Area2D

# Signal that will be emitted when the bullet goes out of screen
signal out_of_bounds

var speed = 400 # speed of the bullet
var direction = Vector2.ZERO

func _ready():
    # Initialize the bullet's direction here, for example:
    direction = Vector2(1, 0).normalized() # Moves right

func _process(delta):
    position += direction * speed * delta
    # Check if the bullet is out of bounds
    if position.x > get_viewport_rect().size.x or position.x < 0:
        emit_signal("out_of_bounds")
        queue_free() # Remove bullet from scene

func on_timeout():
    queue_free() # Remove bullet if it reaches the end of its lifetime