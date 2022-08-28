extends CanvasLayer

onready var gameManager = get_parent()
onready var sprite_container = $HBoxContainer

const SPRITE_POINTS = {
	0: preload("res://sprites/score/0.png"),
	1: preload("res://sprites/score/1.png"),
	2: preload("res://sprites/score/2.png"),
	3: preload("res://sprites/score/3.png"),
	4: preload("res://sprites/score/4.png"),
	5: preload("res://sprites/score/5.png"),
	6: preload("res://sprites/score/6.png"),
	7: preload("res://sprites/score/7.png"),
	8: preload("res://sprites/score/8.png"),
	9: preload("res://sprites/score/9.png"),
}

func _ready() -> void:
	print_sprites()

func get_point_length() -> int:
	return str(gameManager.point).length()

func print_sprites() -> void:

	delete_all_previous_sprite()
	
	for i in get_point_length():
		var current: String = str(gameManager.point)
		var texture_rect = TextureRect.new()
		texture_rect.texture = SPRITE_POINTS[int(current[i])]
		sprite_container.add_child(texture_rect)
		
func delete_all_previous_sprite() -> void:
	for sprite in sprite_container.get_children():
		sprite.queue_free()
