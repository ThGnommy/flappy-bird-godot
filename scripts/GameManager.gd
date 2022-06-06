extends Node2D

var game_started = false
var gameover = false
onready var ready_message = $CanvasLayer/GetReady
onready var _player = get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and game_started == false:
		ready_message.hide()
		game_started = true
		_player.set_process(true)
		_player.jump()
		
	if Input.is_action_pressed("jump") and gameover == true:
		get_tree().reload_current_scene()
