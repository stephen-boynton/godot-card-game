extends Node2D

@export var GameState: Node = null

var game_sm: Node = null
var player_sm: Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_sm = $GameStateMachine

	# game_sm.cards = createCards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	game_sm._process(delta)

