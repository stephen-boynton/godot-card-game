extends Node2D

enum CENTER_TYPE {
    CENTER,
    LEFT,
    RIGHT,
    TOP,
    BOTTOM
}

@export var deck_position: Vector2 = Vector2.ZERO
@export var center_type: CENTER_TYPE = CENTER_TYPE.CENTER
@export var card_spacing: int = 10
@export var player_stash_positions: Array = []
@export var player_discard_positions: Array = []
@export var player_hand_positions: Array = []
@export var player_token_positions: Array = []


