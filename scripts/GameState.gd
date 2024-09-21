extends Node
@export var players: Array = []
@export var cards_per_player: int = 5
@export var max_players: int = 2
@export var current_player: int = 0

var player_turn: int = 0
var player_turn_label: Label = null
var player_turn_text: String = "Player %s's Turn"

var player_scores: Array = []

var turn_number: int = 1
var turn_number_label: Label = null

var dragged_card: Area2D = null