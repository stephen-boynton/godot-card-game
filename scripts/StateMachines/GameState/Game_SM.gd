# StateMachine.gd
extends Node

var current_state: BaseState = null
var states = {}
var cards = []
var deck = null
var table = null
var camera = null
var players = []
var player = null

func _ready():
    deck = get_parent().get_node("Deck")
    table = get_parent().get_node("Table")
    camera = get_parent().get_node("Camera2D")
    player = get_parent().get_node("Player1")
    # Initialize all states
    states["ready"] = Ready.new()
    states["ready"].player = player
    states['ready'].deck = deck
    states["ready"].cards = deck.create_deck()
    states['ready'].camera = camera
    states['ready'].table = table
    states['ready'].starting_player = 0
    states['ready'].change_state = change_state

    states["deal"] = Deal.new()
    states["deal"].deck = deck
    states["deal"].table = table
    states["deal"].player = player
    states["deal"].change_state = change_state

    states["player_turn"] = PlayerTurn.new()
    states["player_turn"].player = player
    states["player_turn"].deck = deck
    states["player_turn"].table = table
    states["player_turn"].camera = camera
    states["player_turn"].change_state = change_state
    

    # Set the initial state
    change_state("ready")

# Method to change the current state
func change_state(new_state_name: String):
    if current_state != null:
        current_state.exit()
    
    current_state = states.get(new_state_name)
    
    if current_state != null:
        current_state.enter()

# Update the current state each frame
func _process(delta: float):
    if current_state != null:
        current_state.update(delta)
