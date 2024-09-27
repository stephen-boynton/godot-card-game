extends Node2D

enum CENTER_TYPE {
    CENTER,
    LEFT,
    RIGHT,
    TOP,
    BOTTOM
}

enum PLAYER_POSITION {
    TOP,
    BOTTOM,
    LEFT,
    RIGHT
}

var position_map = {
    PLAYER_POSITION.TOP: Vector2(0, 0),
    PLAYER_POSITION.BOTTOM: Vector2(0, 0),
    PLAYER_POSITION.LEFT: Vector2(0, 0),
    PLAYER_POSITION.RIGHT: Vector2(0, 0)
}

@export var deck_marker: Marker2D = null
@export var center_type: CENTER_TYPE = CENTER_TYPE.CENTER
@export var card_spacing: int = 10
# @export var player_stash_positions: Array = []
# @export var player_discard_positions: Array = []
# @export var player_token_positions: Array = []

var player_position = PLAYER_POSITION.BOTTOM
var player_hand_position: Vector2 = Vector2(0, 0)
var deck_position: Vector2 = Vector2(0, 0)

func _ready() -> void:
    deck_position = deck_marker.position
    player_hand_position = $Player1HandPosition.global_position
    position_map[PLAYER_POSITION.BOTTOM] = player_hand_position

func position_player(player: Node2D) -> void:
    match player_position:
        PLAYER_POSITION.TOP:
            player.position = position_map[PLAYER_POSITION.TOP]
        PLAYER_POSITION.BOTTOM:
            player.position = player.to_local(position_map[PLAYER_POSITION.BOTTOM])
        PLAYER_POSITION.LEFT:
            player.position = position_map[PLAYER_POSITION.LEFT]
        PLAYER_POSITION.RIGHT:
            player.position = position_map[PLAYER_POSITION.RIGHT]


