# IdleState.gd
extends BaseState

class_name PLayer_Idle

var player = null
var table = null
var change_state: Callable

# setup
func enter():
	# table.position_player(player)
	print("Entering Player Turn State")


# breakdown
func exit():
	player = null
	print("Exiting Idle State")

func update(delta: float):
	pass
