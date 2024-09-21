extends Node2D

@export var Game_State = null
@export var deck: Node2D = null # A reference to the deck node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('initializing game controller')
	Game_State.players = [preload("res://scripts/Player.gd").new(), preload("res://scripts/Player.gd").new()]
	Game_State.cards_per_player = 5
	Game_State.max_players = 2
	Game_State.current_player = 0
	Game_State.player_turn = 0
	Game_State.player_turn_label = $Player_Turn
	Game_State.player_turn_text = "Player %s's Turn"
	Game_State.player_scores = []
	Game_State.turn_number = 1
	Game_State.turn_number_label = $Turn_Number
	Game_State.dragged_card = null

	Game_State.player_turn_label.text = Game_State.player_turn_text % str(Game_State.current_player + 1)
	Game_State.turn_number_label.text = "Turn: " + str(Game_State.turn_number)

	deck.create_deck()
	deck.shuffle_deck()
	deck.stack_deck()
	deck.deal_cards(Game_State.players, Game_State.cards_per_player)

	# # Connect the signal from the deck to the game controller
	# deck.connect("card_dragged", self, "_on_card_dragged")

	# # Connect the signal from the player to the game controller
	# for player in Game_State.players:
	# 	player.connect("card_played", self, "_on_card_played")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("next_turn", self, "_on_next_turn")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("game_over", self, "_on_game_over")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("score_updated", self, "_on_score_updated")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("turn_updated", self, "_on_turn_updated")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("player_turn_updated", self, "_on_player_turn_updated")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("player_added", self, "_on_player_added")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("player_removed", self, "_on_player_removed")

	# # Connect the signal from the game state to the game controller
	# Game_State.connect("player_turn_changed", self, "_on_player_turn_changed")





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
