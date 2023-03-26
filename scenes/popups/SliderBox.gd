extends "res://scenes/popups/AlertBox.gd"

@onready var slider: HSlider = $HSlider

func _on_h_slider_drag_ended(value_changed):
	if slider.value > 95:
		_on_canceled_confirmed()


func _on_close_requested():
	# DO NOTHING
	pass # Replace with function body.
