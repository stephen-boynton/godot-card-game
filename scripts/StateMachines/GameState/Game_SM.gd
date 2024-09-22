# StateMachine.gd
extends Node

var current_state: BaseState = null
var states = {}
var deck = null

func _ready():
    # Initialize all states
    deck = get_parent().get_node("Deck")
    states["ready"] = Ready.new()
    states["ready"].deck = deck
    states["deal"] = Deal.new()
    states["player_tun"] = PlayerTurn.new()
    
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
