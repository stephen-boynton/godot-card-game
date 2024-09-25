extends Node2D

@export var health: int = 100
@export var max_health: int = 100

var player_location = Vector2(0, 0)
var hand: Array = []
var tokens: Array = []
var discard_cards: Array = []
var stash_cards: Array = []
var cards_to_play: Array = []
var table = null
var PlayerSM = null

# Godot Methods ==============================================================
func _ready() -> void:
    table = get_parent().get_node("Table")
    PlayerSM = $PlayerStateMachine
    pass

# Initialization ==============================================================
func init_player(location: Vector2) -> void:
    player_location = location

func _process(delta: float) -> void:
    PlayerSM._process(delta)


# Player Actions ==============================================================
func request_card_from_deck() -> void:
    pass

func request_card_from_discard_pile() -> void:
    pass

func request_card_from_stash() -> void:
    pass

# Selceted Card Manipulation ==============================================================
func select_card_for_play(card: Node2D) -> void:
    cards_to_play.append(card)
    hand.erase(card)
    card.set_visible(false)
    card.set_owner(null)
    card.set_z_index(0)
    print("Selected card for play: " + card.card_suit + " " + card.card_value)

func return_selected_card_to_hand(card: Node2D) -> void:
    hand.append(card)
    card.set_visible(true)
    card.set_owner(self)
    card.set_z_index(hand.size())
    cards_to_play.erase(card)
    print("Returned card to hand: " + card.card_suit + " " + card.card_value)

func play_selected_cards() -> void:
    for card in cards_to_play:
        emit_signal("card_played", card)
        add_card_to_discard_pile(card)
    cards_to_play.clear()

# Hand Manipulation ==============================================================
func add_card_to_hand(card: Node2D) -> void:
    hand.append(card)
    card.move_card_to(Vector2(0, 0))
    card.set_owner(self)
    card.set_visible(true)
    card.set_z_index(hand.size())
    print("Added card to hand: " + card.card_suit + " " + card.card_value)

func get_hand() -> Array:
    return hand


func shuffle_hand() -> void:
    hand.shuffle()

func sort_hand() -> void:
    hand.sort()

func reverse_hand() -> void:
    hand.reverse()

func select_random_card_from_hand() -> Node2D:
    var index = randi() % hand.size()
    return hand[index]

func remove_card_from_hand(card: Node2D) -> void:
    hand.erase(card)
    card.set_visible(false)
    card.set_owner(null)
    card.set_z_index(0)
    print("Removed card from hand: " + card.card_suit + " " + card.card_value)

# Token Manipulation ==============================================================
func add_token(token: Node2D) -> void:
    tokens.append(token)
    token.set_owner(self)
    token.set_visible(true)
    token.set_z_index(tokens.size())
    print("Added token to player: " + token.name)

func get_tokens() -> Array:
    return tokens

func remove_token(token: Node2D) -> void:
    tokens.erase(token)
    token.set_visible(false)
    token.set_owner(null)
    token.set_z_index(0)
    print("Removed token from player: " + token.name)
    
# Discard Pile Manipulation ==============================================================
func add_card_to_discard_pile(card: Node2D) -> void:
    discard_cards.append(card)
    card.move_card_to(Vector2(0, 0))
    card.set_owner(self)
    card.set_visible(true)
    card.set_z_index(discard_cards.size())
    print("Added card to discard pile: " + card.card_suit + " " + card.card_value)

func add_card_to_stash(card: Node2D) -> void:
    stash_cards.append(card)
    card.move_card_to(Vector2(0, 0))
    card.set_owner(self)
    card.set_visible(true)
    card.set_z_index(stash_cards.size())
    print("Added card to stash: " + card.card_suit + " " + card.card_value)

func remove_card_from_discard_pile(card: Node2D) -> void:
    discard_cards.erase(card)
    card.set_visible(false)
    card.set_owner(null)
    card.set_z_index(0)
    print("Removed card from discard pile: " + card.card_suit + " " + card.card_value)

func get_discard_pile() -> Array:
    return discard_cards

# Stash Manipulation ==============================================================
func remove_card_from_stash(card: Node2D) -> void:
    stash_cards.erase(card)
    card.set_visible(false)
    card.set_owner(null)
    card.set_z_index(0)
    print("Removed card from stash: " + card.card_suit + " " + card.card_value)

func get_stash() -> Array:
    return stash_cards

# Health Manipulation ==============================================================
func get_health() -> int:
    return health

func get_max_health() -> int:
    return max_health

func set_health(new_health: int) -> void:
    health = new_health

func set_max_health(new_max_health: int) -> void:
    max_health = new_max_health
