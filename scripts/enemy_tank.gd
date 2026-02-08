extends KinematicBody2D

# Enemy Tank AI Behavior

var speed = 100   # The speed at which the tank moves
var detection_range = 200  # Range at which the tank can detect the player
var target  # The player the tank will track

func _ready():
    # Initial setup can be done here
    pass

func _process(delta):
    # Handle tank behavior each frame
    if target:
        # Move towards the player
        move_towards_player(delta)
    else:
        # Search for the player
        search_for_player()

func move_towards_player(delta):
    var direction = (target.position - position).normalized()
    move_and_slide(direction * speed)

func search_for_player():
    # Logic to detect the player within the detection_range
    # Can use raycasting or area detection
    pass

func _on_Player_detected(player):
    target = player  # Set the target when the player is detected