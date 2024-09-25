# IdleState.gd
extends BaseState

class_name Player_AntiTurn

var player = null

# setup
func enter():
    print("Entering Player Turn State")


# breakdown
func exit():
    player = null

func update(delta: float):
    pass



