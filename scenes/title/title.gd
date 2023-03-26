extends Control


signal change_scene(to: String)


func _on_start_pressed() -> void:
	emit_signal("change_scene", "res://scenes/levels/Level1.tscn")


func _on_load_pressed() -> void:
	SaveLoad.show_save_load()


func _on_options_pressed() -> void:
	Options.show_options()
