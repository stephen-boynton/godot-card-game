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
		# for player in players:
		table.position_player(player)

		deck.connect("deal_requested", Callable(self, "_on_deal_requested"))
# `		table.set_table()
		camera.make_current()
		# deck.create_deck(cards)
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
	print("REQUESTED")
	change_state.call('deal')
