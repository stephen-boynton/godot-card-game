extends Node

@export var state = {
    "deck": null,
    "players": [],
    "cards_per_player": 5,
    "max_players": 2,
    "current_player": 0,
    "player_turn": 0,
    "player_turn_label": null,
    "player_turn_text": "Player %s's Turn",
    "player_scores": [],
    "turn_number": 1,
    "turn_number_label": null,
}

func initialize() -> void:
    state["deck"] = $Controller/Deck
    state["players"] = [preload("res://scripts/Player.gd").new(), preload("res://scripts/Player.gd").new()]