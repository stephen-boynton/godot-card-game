extends Node2D

var hand: Array = []
var card_locations: Array = [
	Vector2(0, 0),
	Vector2(0, 0),
	Vector2(0, 0),
	Vector2(0, 0),
	Vector2(0, 0),
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_card_to_hand(card: Node2D) -> void:
	hand.append(card)
	card.move_card_to(Vector2(0, 0))
	card.set_owner(self)
	card.set_visible(true)
	card.set_z_index(hand.size())
