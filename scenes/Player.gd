extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var viewport = get_viewport().size

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = viewport.x / 2
	position.y = viewport.y / 2

func _process(delta):
	position.x += 1
	pass
