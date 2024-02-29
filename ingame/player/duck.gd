extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var moving_collider = $CollisionShape2D
@onready var rolling_snd = $Rolling
@onready var stopping_snd = $Stopping
@onready var coin_snd = $Coin

signal wall_collision

var move_speed: int = 400
var mask_is_centered = true
var collision = false
var hitting = false
var motion = Vector2.ZERO
var playing = Vector2.ZERO
var win_con = false


func _physics_process(_delta):
	# ----MOV UNTIL COLLIDE-------- 
	if playing:
		motion = playing
		if mask_is_centered == true:
			# Su máscara de colisión se adelanta para comprobar choques.
			moving_collider.position += motion * 5
			mask_is_centered = false

	velocity = motion * move_speed
	collision = move_and_slide()

	if collision:
		hitting_process()
	elif not hitting:
		update_animation(motion)
	# ------------

	#if Input.is_action_just_pressed("testing"):
		#await hit_by_button()


func hitting_process():
	'''Si choca, para y recupera su máscara de colisión.'''
	motion = Vector2.ZERO
	playing = Vector2.ZERO
	moving_collider.position = animated_sprite.position
	mask_is_centered = true
	hitting = true
	hit_in_wall()


func hit_in_wall():
	'''Cuando choca, animación y señal para pasar al siguiente movimiento.'''
	stopping_snd.play()
	animated_sprite.play("hit")
	await animated_sprite.animation_finished
	hitting = false
	wall_collision.emit()


func update_animation(direction: Vector2):
	'''Las animaciones según se mueva hacia los lados.'''
	var animation = "idle"
	if direction:
		if not rolling_snd.playing:
			rolling_snd.play()
		if direction.x > 0:
			animated_sprite.flip_h = false
			animation = "roll_y"
		elif direction.x < 0:
			animated_sprite.flip_h = true
			animation = "roll_y"
		elif direction.y < 0:
			animation = "roll_x"
		elif direction.y > 0:
			animation = "roll_x"
		
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)


