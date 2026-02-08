# Game Manager Script

extends Node

# This script manages the overall game state, including starting and ending the game,
# tracking scores, and handling transitions between different game scenes.

var score: int = 0
var is_game_over: bool = false

# Call this method to start the game
func start_game():
    score = 0
    is_game_over = false
    print("Game started!")

# Call this method to end the game
func end_game():
    is_game_over = true
    print("Game Over! Your score: " + str(score))

# Call this method to increase the score
func increase_score(amount: int):
    if !is_game_over:
        score += amount
        print("Score: " + str(score))
    else:
        print("Cannot increase score, the game is over!")

# Call this method to reset the game
func reset_game():
    start_game()