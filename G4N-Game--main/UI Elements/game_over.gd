extends Control


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://UI Elements/Menu Scren Modified.tscn")


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/game.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
