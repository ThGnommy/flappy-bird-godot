extends Node2D

var game_started = false
var gameover = false
var can_create_pipe = false
onready var ready_message = $CanvasLayer/GetReady
onready var _player = get_node("Player")
onready var timer = get_node("./PipesTimer")
var pipe = preload("res://scenes/pipe.tscn")
onready var pipes_container = get_node("./PipesContainer/ParallaxLayer")
export var point = 0

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
		can_create_pipe = true
		
	if Input.is_action_pressed("jump") and gameover == true:
		get_tree().reload_current_scene()
	
	if can_create_pipe == true:
		generate_pipe()

	
func generate_pipe():
	timer.start()
	can_create_pipe = false


func _on_PipesTimer_timeout() -> void:
	if gameover == true:
		return

	var new_pipe = pipe.instance()
	new_pipe.position.x = _player.position.x + 1000
	pipes_container.add_child(new_pipe)
	print("pipe created")
	can_create_pipe = true
