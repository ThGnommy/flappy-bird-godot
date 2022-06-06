extends StaticBody2D

onready var viewport: Vector2 = get_viewport().size
onready var player = get_node("../Player")
var half_viewport 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	half_viewport = viewport.x / 2


func _process(delta: float) -> void:
	self.position.x = player.position.x - half_viewport
