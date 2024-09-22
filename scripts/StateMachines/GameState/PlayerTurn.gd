extends BaseState

class_name PlayerTurn

var player = null

func enter():
    print("Entering Player Turn State")
    # player = get_tree().get_current_scene().get_node("Player")

func update(delta: float):
    print("In Player Turn State")
    # if player.is_turn_over():
    #     get_tree().set_current_state("GameState/EnemyTurn")
    #     return
    # if player.is_dead():
    #     get_tree().set_current_state("GameState/GameOver")
    #     return
    # if player.is_victorious():
    #     get_tree().set_current_state("GameState/Victory")
    #     return