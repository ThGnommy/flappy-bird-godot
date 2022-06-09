extends KinematicBody2D

onready var viewport: Vector2 = get_viewport().size
const gravity := 30.0
const speed := 150
const up_speed := -6
var velocity := Vector2.ZERO
onready var gameover_msg = get_node("../CanvasLayer/GameoverMsg")
onready var gamemanager = get_parent()
onready var anim_sprite = $AnimatedSprite
onready var anim_player = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var timer = $Timer
onready var camera2d = $Camera2D

onready var sfx_jump = $sfx/sfx_jump
onready var sfx_hit = $sfx/sfx_hit


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	
func _process(delta: float) -> void:
	velocity.x = speed * delta
	velocity.y += gravity * delta

	var collision = move_and_collide(velocity)

	# Game over
	if collision:
		die()
 
 # set a max velocity
	if velocity.y > 20:
		velocity.y = 20

	jump()
	lock_camera_position()
 
	# set rotation when falling
	if velocity.y > 9:
		anim_tree["parameters/Flappy/playback"].travel("rotate_down")

	if velocity.y < 3:
		anim_tree["parameters/Flappy/playback"].travel("rotate_up")
		pass

func die():
	anim_sprite.stop()
	anim_tree.queue_free()
	gameover_msg.show()
	sfx_hit.play()
	gamemanager.gameover = true
	
	set_process(false)

func lock_camera_position():
	camera2d.limit_bottom = viewport.y
	camera2d.limit_top = 0

func jump():
 # avoid player jump too high
	if position.y < 0:
		return

	if Input.is_action_just_pressed("jump"):
		velocity.y = up_speed
		anim_sprite.play("flap")
		#anim_player.play("rotate_up")
		#anim_tree.set("parameters/Blend/blend_amount", 1)
		timer.start()
		sfx_jump.play()

func _on_Timer_timeout() -> void:
	anim_sprite.stop()
