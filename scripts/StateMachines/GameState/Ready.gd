# IdleState.gd
extends BaseState

class_name Ready

var deck = null
var table = null
var camera = null
var cards = []
var player = null
var starting_player = 0
var change_state: Callable

# setup
func enter():
	if deck and table and camera:
		deck.connect("deal_requested", Callable(self, "_on_deal_requested"))
		camera.make_current()
		deck.shuffle_deck()
		deck.stack_deck(table.deck_position)

# breakdown
func exit():
	deck.disconnect("deal_requested", Callable(self, "_on_deal_requested"))
	camera = null
	deck = null
	table = null
	player = null

func update(delta: float):
	pass

func _on_deal_requested() -> void:
	change_state.call('deal')
