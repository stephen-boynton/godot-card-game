extends Node2D

@export var GameState: Node = null
@export var deck: Node2D = null

@onready var camera = $Camera2D

var deck_position: Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.make_current()
	GameState.players = [preload("res://scripts/Player.gd").new(), preload("res://scripts/Player.gd").new()]
	GameState.cards_per_player = 5
	GameState.max_players = 2
	GameState.current_player = 0
	GameState.player_turn = 0
	GameState.player_turn_label = $Player_Turn
	GameState.player_turn_text = "Player %s's Turn"
	GameState.player_scores = []
	GameState.turn_number = 1
	GameState.turn_number_label = $Turn_Number
	GameState.dragged_card = null

	# GameState.player_turn_label.text = GameState.player_turn_text % str(GameState.current_player + 1)
	# GameState.turn_number_label.text = "Turn: " + str(GameState.turn_number)

	deck.create_deck()
	deck.shuffle_deck()
	deck_position = $DeckPosition.position
	deck.stack_deck(deck_position)


	# deck.deal_cards(GameState.players, GameState.cards_per_player)

	# # Connect the signal from the deck to the game controller
	# deck.connect("card_dragged", self, "_on_card_dragged")

	# # Connect the signal from the player to the game controller
	# for player in GameState.players:
	# 	player.connect("card_played", self, "_on_card_played")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("next_turn", self, "_on_next_turn")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("game_over", self, "_on_game_over")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("score_updated", self, "_on_score_updated")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("turn_updated", self, "_on_turn_updated")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("player_turn_updated", self, "_on_player_turn_updated")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("player_added", self, "_on_player_added")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("player_removed", self, "_on_player_removed")

	# # Connect the signal from the game state to the game controller
	# GameState.connect("player_turn_changed", self, "_on_player_turn_changed")





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
