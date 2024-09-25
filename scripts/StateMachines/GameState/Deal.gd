extends BaseState

class_name Deal

var player = null
var deck = null
var table = null
var camera = null


func enter():
    pass

func update(delta: float):
    pass
    # if player.is_turn_over():
    #     get_tree().set_current_state("GameState/EnemyTurn")
    #     return
    # if player.is_dead():
    #     get_tree().set_current_state("GameState/GameOver")
    #     return
    # if player.is_victorious():
    #     get_tree().set_current_state("GameState/Victory")
    #     return