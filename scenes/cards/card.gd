extends Area2D
@export var card_value: String = "Ace"
@export var card_suit: String = "Spades"
@export var card_back: CompressedTexture2D 
@export var card_front: CompressedTexture2D

signal card_dragged(card: Node2D)
signal card_dropped()

var initial_z_index: int = 0  # The initial z-index of the card
var card_sprite_node: Sprite2D
var is_face_up: bool = false
var dragging: bool = false 
var drag_offset: Vector2 = Vector2.ZERO
var is_top: bool = false

func _ready() -> void:
	initial_z_index = z_index
	card_sprite_node = get_node("card_sprite")
	card_front = load("res://assets/Playing Cards/" + card_suit + "/" + card_value + ".png")
	card_back = load("res://assets/Playing Cards/card-back2.png")
	set_process_input(true)

# func _input_event(viewport, event, shape_idx) -> void:
# 	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
# 		if event.pressed and is_top:
# 			print(is_top)
# 			dragging = true
# 			emit_signal("card_dragged", self)
# 		else:
# 			emit_signal("card_dropped")
# 			dragging = false


func is_card() -> bool:
	return true

func set_card(suit: String, value: String, sprite: CompressedTexture2D) -> void:
	card_suit = suit
	card_value = value
	card_sprite_node.texture = sprite

func flip_card() -> void:
	if card_sprite_node.texture == card_back:
		card_sprite_node.texture = card_front
		is_face_up = true
	else:
		card_sprite_node.texture = card_back
		is_face_up = false

func move_card_to(pos: Vector2) -> void:
	self.position = pos
