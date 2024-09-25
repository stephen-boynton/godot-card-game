extends Node2D

class_name Deck
@export_group("Deck Settings")
@export var deck_name: String = "Deck"
@export var description: String = "This is a deck"
@export var id: int = 0
@export var cards: Array = []
@export var size: int = 0
@export var max_size: int = 0
@export var min_size: int = 0
@export var is_shuffled: bool = false
@export var is_sorted: bool = false
@export var is_reversed: bool = false
@export var is_in_use: bool = false
@export var is_useable: bool = false
@export var display_image: Texture

# Signals =====================================================================
signal deal_requested()

var is_right_side_up: bool = false
var is_complete: bool = false
var is_empty: bool = false

# Godot Methods ==============================================================
func _ready():
    pass

func _input_event(viewport, event, shape_idx) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        if event.pressed:
            emit_signal("deal_requested")

# Deck Manipulation ==============================================================
func create_deck():
    var suits = ["spades", "hearts", "diamonds", "clubs"]
    var values = range(1, 14)
    var stub = "res://assets/Playing Cards/"
    var x_position = position.x
    for suit in suits:
        for value in values:
            var card_scene = preload("res://scenes/cards/card.tscn").instantiate()
            card_scene.visible = true
            card_scene.connect("card_dragged", Callable(self, "_on_card_dragged"))
            card_scene.connect("card_dropped", Callable(self, "_on_card_dropped"))

            self.add_child(card_scene)
            var card_sprite_key = "card-" + suit + "-" + "%s" % value + ".png"

            var sprite = load(stub + card_sprite_key)

            if sprite == null:
                print("Failed to load sprite for: " + stub + card_sprite_key)
            else:
                # print("Successfully loaded sprite for: " + stub + card_sprite_key)
                pass

            card_scene.set_card(suit, card_sprite_key, sprite)
            card_scene.flip_card()
            cards.append(card_scene)
            # stagger card positions so it looks like a deck
            card_scene.position = Vector2(x_position, position.y)
            x_position += 0.1

    return cards


func shuffle_deck():
    cards.shuffle()

func sort_deck():
    cards.sort()

func reverse_deck():
    cards.reverse()

func stack_deck(deck_position: Vector2):
    position = deck_position

func clear_deck():
    cards.clear()
    check_deck()

func check_deck():
    is_empty = cards.size() == 0
    is_complete = cards.size() == max_size

# Card Manipulation =====================================================================
func add_card_to_bottom(card: Node):
    cards.append(card)

func add_card_to_top(card: Node):
    cards.push_back(card)

func add_card_at_position(card: Node, pos: int):
    cards.insert(pos, card)

func add_card_to_random_position(card: Node):
    var index = randi() % cards.size()
    cards.insert(index, card)

func remove_card(card: Node):
    cards.erase(card)

func remove_card_at_position(pos: int):
    cards.erase(pos)

func remove_card_at_random_position():
    var index = randi() % cards.size()
    cards.erase(index)

func draw_card(num: int):
    var drawn_cards = []
    for i in range(num):
        if cards.size() > 0:
            var card = cards.pop_front()
            drawn_cards.append(card)
    return drawn_cards

func draw_random_cards(num: int):
    var drawn_cards = []
    for i in range(num):
        if cards.size() > 0:
            var index = randi() % cards.size()
            var card = cards[index]
            cards.erase(index)
            drawn_cards.append(card)
    check_deck()
    return drawn_cards


func deal_cards(players: Array, cards_per_player: int):
    for i in range(cards_per_player):
        if cards.size() > 0:
            for player in players:
                var card = cards.pop_front()
                player.add_card_to_hand(card)
    check_deck()



