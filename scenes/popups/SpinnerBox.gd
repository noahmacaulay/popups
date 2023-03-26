extends "res://scenes/popups/AlertBox.gd"

var target_val : int = 1
@onready var spinner : SpinBox = $Container/SpinBox

func _ready():
	super._ready()
	randomize()
	target_val = 1 + randi() %9
	self.dialog_text = "Please 😇 set the value to: " + str(target_val)

func _on_spin_box_value_changed(value):
	if value == target_val:
		_on_canceled_confirmed()
