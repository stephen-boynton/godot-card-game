# StateMachine.gd
extends Node

var current_state: BaseState = null
var states = {}
var cards = []
var deck = null
var table = null

func _ready():
    deck = get_parent().get_node("Deck")
    table = get_parent().get_node("Table")
    states["idle"] = PLayer_Idle.new()
    states['idle'].table = table
    states['idle'].change_state = change_state
    change_state("idle")

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
