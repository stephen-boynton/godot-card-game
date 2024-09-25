extends Area2D

class_name Card
@export_group("Card Settings")
@export var card_name: String = "Card"
@export var card_type: String = "Card"
@export var card_description: String = "This is a card"
@export var card_front: Texture
@export var card_back: Texture
@export var card_id: int = 0
@export var card_value: int = 0
@export var card_cost: int = 0
@export var card_rarity: int = 0
@export var card_display_image: Texture

var is_right_side_up: bool = false
var is_in_use: bool = false
var is_useable: bool = false

func _ready():
    pass



