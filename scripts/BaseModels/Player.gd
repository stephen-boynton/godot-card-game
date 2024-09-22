extends Node2D

@export var health: int = 100
@export var max_health: int = 100


var hand: Array = []
var tokens: Array = []
var discard_cards: Array = []
var stash_cards: Array = []

func request_card_from_deck() -> void:
    pass

func request_card_from_discard_pile() -> void:
    pass

func request_card_from_stash() -> void:
    pass

func add_card_to_hand(card: Node2D) -> void:
    hand.append(card)
    card.move_card_to(Vector2(0, 0))
    card.set_owner(self)
    card.set_visible(true)
    card.set_z_index(hand.size())
    print("Added card to hand: " + card.card_suit + " " + card.card_value)

func add_token(token: Node2D) -> void:
    tokens.append(token)
    token.set_owner(self)
    token.set_visible(true)
    token.set_z_index(tokens.size())
    print("Added token to player: " + token.name)

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

func remove_card_from_hand(card: Node2D) -> void:
    hand.erase(card)
    card.set_visible(false)
    card.set_owner(null)
    card.set_z_index(0)
    print("Removed card from hand: " + card.card_suit + " " + card.card_value)

func remove_token(token: Node2D) -> void:
    tokens.erase(token)
    token.set_visible(false)
    token.set_owner(null)
    token.set_z_index(0)
    print("Removed token from player: " + token.name)

func remove_card_from_discard_pile(card: Node2D) -> void:
    discard_cards.erase(card)
    card.set_visible(false)
    card.set_owner(null)
    card.set_z_index(0)
    print("Removed card from discard pile: " + card.card_suit + " " + card.card_value)

func remove_card_from_stash(card: Node2D) -> void:
    stash_cards.erase(card)
    card.set_visible(false)
    card.set_owner(null)
    card.set_z_index(0)
    print("Removed card from stash: " + card.card_suit + " " + card.card_value)

func get_hand() -> Array:
    return hand

func get_tokens() -> Array:
    return tokens

func get_discard_pile() -> Array:
    return discard_cards

func get_stash() -> Array:
    return stash_cards

func get_health() -> int:
    return health

func get_max_health() -> int:
    return max_health

func set_health(new_health: int) -> void:
    health = new_health

func set_max_health(new_max_health: int) -> void:
    max_health = new_max_health

func _ready() -> void:
    pass