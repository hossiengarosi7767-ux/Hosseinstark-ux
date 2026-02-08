extends KinematicBody2D

export var speed = 200
export var rotation_speed = 4
export var fire_cooldown = 0.5

var velocity = Vector2.ZERO
var can_fire = true
var fire_timer = 0
var bullet_scene = preload("res://scenes/Bullet.tscn")
var explosion_sound = preload("res://assets/sounds/explosion.ogg")
var engine_sound = preload("res://assets/sounds/engine.ogg")

func _ready():
	$AudioStreamPlayer.stream = engine_sound
	$AnimatedSprite.play("move")

func _physics_process(delta):
	handle_input()
	handle_cooldown(delta)
	move_and_slide(velocity)
	update_animation()

func handle_input():
	var input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	
	if input_vector.length() > 0:
		input_vector = input_vector.normalized()
		rotation = input_vector.angle()
		velocity = input_vector * speed
	else:
		velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_select") and can_fire:
		fire()

func fire():
	can_fire = false
	fire_timer = fire_cooldown
	
	var bullet = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.position = global_position + Vector2(cos(rotation), sin(rotation)) * 30
	bullet.rotation = rotation
	bullet.velocity = Vector2(cos(rotation), sin(rotation)) * 500
	
	$AudioStreamPlayer2D.stream = explosion_sound
	$AudioStreamPlayer2D.play()

func handle_cooldown(delta):
	if not can_fire:
		fire_timer -= delta
		if fire_timer <= 0:
			can_fire = true

func update_animation():
	if velocity.length() > 0:
		$AnimatedSprite.play("move")
	else:
		$AnimatedSprite.play("idle")