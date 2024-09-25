extends Node2D

@export var GameState: Node = null

var round_history: Array = []

func _ready() -> void:
    GameState = $GameState

func prepare_table() -> void:
    pass

func get_table() -> Node2D:
    return get_node("Table")

func get_deck() -> Node2D:
    return get_node("Deck")

func get_players() -> Array:
    return GameState.state["players"]

func get_current_player() -> int:
    return GameState.state["current_player"]

func get_player_turn() -> int:
    return GameState.state["player_turn"]

func next_round() -> void:
    build_round_outcome()
    GameState.state["current_player"] = 0
    GameState.state["player_turn"] = 0
    GameState.state["turn_number"] += 1

func build_round_outcome() -> void:
    var round_outcome = {
        "round_number": GameState.state["turn_number"],
        "player_scores": GameState.state["player_scores"],
        "player_turn": GameState.state["player_turn"],
        "current_player": GameState.state["current_player"],
    }
    round_history.append(round_outcome)

func previous_round() -> void:
    if round_history.size() > 0:
        var last_round = round_history.pop_back()
        GameState.state["current_player"] = last_round["current_player"]
        GameState.state["player_turn"] = last_round["player_turn"]
        GameState.state["turn_number"] = last_round["round_number"]

func get_history() -> Array:
    return round_history

func end_game() -> void:
    pass

func set_score(player: int, score: int) -> void:
    GameState.state["player_scores"][player] = score

func get_score(player: int) -> int:
    return GameState.state["player_scores"][player]

func get_scores() -> Array:
    return GameState.state["player_scores"]

func get_turn_number() -> int:
    return GameState.state["turn_number"]

func start_game() -> void:
    pass

func draw_card(player: int) -> void:
    pass

func play_card(player: int, card: Node2D) -> void:
    pass

func play_cards(player: int, cards: Array) -> void:
    pass

func end_turn() -> void:
    pass

func set_deck(deck: Node2D) -> void:
    GameState.state["deck"] = deck

func set_players(players: Array) -> void:
    GameState.state["players"] = players

func deal_cards() -> void:
    pass

func discard_card(player: int, card: Node2D) -> void:
    pass

func discard_cards(player: int, cards: Array) -> void:
    pass

func set_player_turn(player: int) -> void:
    GameState.state["player_turn"] = player

func set_current_player(player: int) -> void:
    GameState.state["current_player"] = player

func set_turn_number(turn: int) -> void:
    GameState.state["turn_number"] = turn

func damage_player(player: int, damage: int) -> void:
    pass

func heal_player(player: int, heal: int) -> void:
    pass

func set_player_score(player: int, score: int) -> void:
    GameState.state["player_scores"][player] = score

func get_all_cards_on_table() -> void:
    pass

func get_all_cards_in_deck() -> void:
    pass

func get_all_cards_in_discard_pile() -> void:
    pass

func get_all_cards_in_players_hands() -> void:
    pass

func get_player_stash_cards(player: int) -> void:
    pass

func get_player_discard_pile(player: int) -> void:
    pass



