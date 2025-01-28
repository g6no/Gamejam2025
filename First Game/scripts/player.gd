extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

enum character {MAN, WOLF}

const man_animations = {
	"idle": "idle_man",
	"jump": "jump_man",
	"run": "run_man"
}

const wolf_animations = {
	"idle": "idle_wolf",
	"jump": "jump_wolf",
	"run": "run_wolf"
}

var cur_char
var cur_animation

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	cur_char = character.WOLF
	cur_animation = wolf_animations
	#await DialogueManager.show_dialogue_balloon(load("res://dialogue1.dialogue"), "start")

#func change_animation() -> void:
	#if character == character.MAN:
		#$AnimatedSprite2D.

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_key_pressed(KEY_K):
		if cur_char == character.MAN:
			cur_char = character.WOLF
			cur_animation = wolf_animations
		elif cur_char == character.WOLF:
			cur_char = character.MAN
			cur_animation = man_animations
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play(cur_animation["idle"])
		else:
			animated_sprite.play(cur_animation["run"])
	else:
		animated_sprite.play(cur_animation["jump"])
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
