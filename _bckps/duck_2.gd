extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var moving_collider = $CollisionShape2D

var move_speed: int = 150
var mask_is_centered = true
var collision = false
var motion = Vector2.ZERO 
var playing = false

#func _ready():
	#position = Vector2(160, 544)

func _physics_process(_delta):
	if Input.is_action_just_pressed("print"):
		motion = Vector2(10, 0)
	elif collision:
		motion = Vector2.ZERO
		
	velocity = motion * move_speed
	collision = move_and_slide()
	update_animation(motion)
	#print(collision, motion)


#func play_recorded():
	#if collision == true:
		#motion = Vector2(0, 0)
	#else:
		#motion = Vector2(10,0)



func update_animation(direction: Vector2):
	var animation = "idle"
	if collision:
		animation = "hit"
		#animated_sprite.animation
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


