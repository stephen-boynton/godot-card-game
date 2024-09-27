extends BaseState

class_name Deal

var player = null
var deck = null
var table = null
var camera = null
var change_state: Callable


func enter():
    deck.deal_cards([player], 5, table)
    change_state.call('player_turn')

func update(delta: float):
    pass
