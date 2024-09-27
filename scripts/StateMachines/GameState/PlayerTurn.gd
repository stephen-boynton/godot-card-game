# IdleState.gd
extends BaseState

class_name PlayerTurn

var player = null
var deck = null
var table = null
var camera = null
var change_state: Callable

# setup
func enter():
    player.PlayerSM.change_state("active")


# breakdown
func exit():
    player = null
    deck = null
    table = null
    camera = null

func update(delta: float):
    pass



