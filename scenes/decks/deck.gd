extends Node2D

@export var card_sprites: Dictionary # A dictionary to store sprites for each card
var deck: Array = [] # This will hold the cards

# Initialize the deck with all 52 cards
# func _ready():
# 	create_deck()
# 	shuffle_deck()


# Create all the cards dynamically
func create_deck():
	var suits = ["spades", "hearts", "diamonds", "clubs"]
	var values = range(1, 14)
	var stub = "res://assets/Playing Cards/"
	var x_position = 36
	var y_position = 50
	var card_spacing = 100

	for suit in suits:
		for value in values:
			var card_scene = preload("res://scenes/cards/card.tscn").instantiate()
			card_scene.position = Vector2(x_position, y_position)
			card_scene.visible = true
			add_child(card_scene)
			var card_sprite_key = "card-" + suit + "-" + "%s" % value + ".png"

			var sprite = load(stub + card_sprite_key)

			if sprite == null:
				print("Failed to load sprite for: " + stub + card_sprite_key)
			else:
				print("Successfully loaded sprite for: " + stub + card_sprite_key)
			card_scene.set_card(suit, card_sprite_key, sprite)
			card_scene.flip_card()
			deck.append(card_scene)

# Shuffle the deck
func shuffle_deck():
	deck.shuffle()

# Deal cards to players (pass in the number of cards and player array or reference)
func deal_cards(player_hands: Array, cards_per_player: int):
	for i in range(cards_per_player):
		for player in player_hands:
			if deck.size() > 0:
				var card = deck.pop_front() # Remove the top card from the deck
				player.add_card_to_hand(card) # Add the card to the player's hand (assuming the player has a method for this)

func stack_deck():
	var x_position = 500
	var y_position = 50
	var card_spacing = 0.3
	print('stacking the deck')

	for card in deck:
		card.position = Vector2(x_position, y_position)
		x_position += card_spacing
