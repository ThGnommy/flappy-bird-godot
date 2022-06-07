extends Node2D

var rng = RandomNumberGenerator.new()
onready var viewport: Vector2 = get_viewport().size
onready var camera = get_node("../Player/Camera2D")

var pos_to_delete: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	var random_y = rng.randi_range(400, 800)
	position.y = random_y
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < (camera.get_camera_position().x - viewport.x / 2) - 300:
		queue_free()

