extends Area2D
@export var card_value: String = "Ace"
@export var card_suit: String = "spades"
@export var card_back: CompressedTexture2D 
@export var card_front: CompressedTexture2D

signal card_dragged(card: Node2D)
signal card_dropped()
signal card_hovered(card: Node2D)

enum CARD_STATE {
	NEUTRAL,
	SELECTABLE
}

var initial_z_index: int = 0  # The initial z-index of the card
var card_sprite_node: Sprite2D
var is_face_up: bool = false
var dragging: bool = false 
var drag_offset: Vector2 = Vector2.ZERO
var is_top: bool = false
var card_state: CARD_STATE = CARD_STATE.NEUTRAL

func _ready() -> void:
	initial_z_index = z_index
	card_sprite_node = get_node("card_sprite")
	card_sprite_node.centered = true
	card_front = load("res://assets/Playing Cards/" + card_suit + "/" + card_value + ".png")
	card_back = load("res://assets/Playing Cards/card-back2.png")
	set_process_input(true)

func make_selectable() -> void:
	card_state = CARD_STATE.SELECTABLE

func _on_mouse_entered():
	if card_state == CARD_STATE.SELECTABLE:
		emit_signal("card_hovered", self)
		z_index = 100
		scale = Vector2(1.2, 1.2)

# Called when the mouse exits the CollisionShape2D
func _on_mouse_exited():
	if card_state == CARD_STATE.SELECTABLE:
		z_index = initial_z_index
		scale = Vector2(1, 1)


func is_card() -> bool:
	return true

func set_card(suit: String, value: String, sprite: CompressedTexture2D) -> void:
	card_suit = suit
	card_value = value
	card_front = sprite
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
