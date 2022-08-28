extends Node2D

var rng = RandomNumberGenerator.new()
onready var viewport: Vector2 = get_viewport().size
onready var camera = get_node("../../../Player/Camera2D")
onready var point_collector = $RayCast2D
onready var gameManager = get_node("/root/Main")
onready var sfx_collect_point = $sfx_collect_point
onready var score = get_node("/root/Main/GetReadyScreen")

var pos_to_delete: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	var random_y = rng.randi_range(400, 800)
	position.y = random_y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if camera and position.x < (camera.get_camera_position().x - viewport.x / 2) - 300:
		queue_free()

	if point_collector:
		if point_collector.is_colliding() and point_collector.get_collider().name == "Player":
			point_collector.enabled = false
			gameManager.point += 1
			score.print_sprites()
			sfx_collect_point.play()
