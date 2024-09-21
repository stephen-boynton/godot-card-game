extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D.make_current()  # Ensure the correct camera is active
	print('definitely running')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
