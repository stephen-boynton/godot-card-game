# IdleState.gd
extends BaseState

class_name Ready

var deck = null
var table = null
var camera = null

# setup
func enter():
    deck = get_tree().get_current_scene().get_node("Deck")
    table = get_tree().get_current_scene().get_node("Table")
    camera = get_tree().get_current_scene().get_node("Camera2D")

    deck.connect("deal_requested", Callable(self, "_on_deal_requested"))
    camera.make_current()
    deck.create_deck()
    deck.shuffle_deck()
    deck.stack_deck(table.deck_position)

# breakdown
func exit():
    deck.disconnect("deal_requested", Callable(self, "_on_deal_requested"))
    camera = null
    deck = null
    table = null
    print("Exiting Idle State")

func update(delta: float):
    pass

func _on_deal_requested() -> void:
    get_parent().change_state("deal")


