extends KinematicBody2D

onready var viewport: Vector2 = get_viewport().size
const gravity := 30.0
const speed := 150
const up_speed := -6
var velocity := Vector2.ZERO
onready var gameover_msg = get_node("../CanvasLayer/GameoverMsg")
onready var gamemanager = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	#position.x = viewport.x / 2
	#position.y = viewport.y / 2
	set_process(false)
	pass
	
func _process(delta: float) -> void:
	velocity.x = speed * delta
	velocity.y += gravity * delta

	var collision = move_and_collide(velocity)

	# Game over
	if collision:
		gameover_msg.show()
		gamemanager.gameover = true
		set_process(false)
 
 # set a max velocity
	if velocity.y > 20:
		velocity.y = 20

	jump()
	lock_camera_position()
 
	# set rotation when falling
	if velocity.y > 3:
		$AnimationPlayer.play("rotate_down")

	if velocity.y < 3:
		$AnimationPlayer.play("RESET")


func lock_camera_position():
	$Camera2D.limit_bottom = viewport.y
	$Camera2D.limit_top = 0

func jump():
 # avoid player jump too high
	if position.y < 0:
		return

	if Input.is_action_just_pressed("jump"):
		velocity.y = up_speed
		$AnimatedSprite.play("flap")
		$Timer.start()

func _on_Timer_timeout() -> void:
	$AnimatedSprite.stop()
