extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var moving_collider = $CollisionShape2D

var move_speed: int = 400
var mask_is_centered = true
var collision = false
var motion = Vector2.ZERO
var playing = Vector2.ZERO

#func _ready():
	#position = Vector2(160, 544)

func _physics_process(delta):
	# MOVIMIENTOS POR INPUT
	#motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	# o TOTAL:
	#motion = Input.get_vector("move_left","move_right", "move_up", "move_down")
	
	# ----MOV UNTIL COLLIDE-------- 

	if Input.is_action_just_pressed("print"):
		motion = Vector2.RIGHT
		if mask_is_centered == true:
			moving_collider.position += motion * 5
			mask_is_centered = false
	elif collision:
		motion = Vector2.ZERO
		moving_collider.position = animated_sprite.position
		mask_is_centered = true

	velocity = motion * move_speed
	collision = move_and_slide()
	update_animation(motion)
	# ------------
	



func update_animation(direction: Vector2):
	var animation = "idle"
	if collision:
		animation = "hit"
		#animated_sprite.animation
	elif direction.x > 0:
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



func _on_timer_moves_timeout():
	pass # Replace with function body.
