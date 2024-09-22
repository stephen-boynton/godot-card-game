extends Node

class StateMachine:
    var state: int = 0
    var states: Array = []

    func add_state(state: int, callback: Callable) -> void:
        states[state] = callback

    func change_state(state: int) -> void:
        self.state = state

    func get_state() -> int:
        return state

    func update() -> void:
        if state in states:
            states[state].call()