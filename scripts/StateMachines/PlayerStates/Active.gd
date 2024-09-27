# IdleState.gd
extends BaseState

class_name Player_Active

var player = null

# setup
func enter():
    print("Entering Player Active State")


# breakdown
func exit():
    player = null

func update(delta: float):
    pass



