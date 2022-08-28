extends ParallaxBackground


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var bg_day = get_node("ParallaxLayer/background_day")
onready var bg_night = get_node("ParallaxLayer/background_night")

var time = OS.get_time()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if time["hour"] > 18:
		bg_night.show()
	elif time["hour"] < 18:
		bg_day.show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
