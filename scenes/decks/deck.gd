extends Node2D

@export var card_sprites: Dictionary # A dictionary to store sprites for each card
var deck: Array = [] # This will hold the cards

func create_deck():
	var suits = ["spades", "hearts", "diamonds", "clubs"]
	var values = range(1, 14)
	var stub = "res://assets/Playing Cards/"

	for suit in suits:
		for value in values:
			var card_scene = preload("res://scenes/cards/card.tscn").instantiate()
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

func stack_deck(deck_position: Vector2):
	var x_position = deck_position.x
	var card_spacing = 0.3

	for card in deck:
		card.position = Vector2(x_position, deck_position.y)
		x_position += card_spacing
