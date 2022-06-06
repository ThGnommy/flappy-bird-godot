class_name GameManager
extends Node2D

var game_started = false
var gameover = false

onready var _player = get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and game_started == false:
		game_started = true
		_player.set_process(true)
		_player.jump()
