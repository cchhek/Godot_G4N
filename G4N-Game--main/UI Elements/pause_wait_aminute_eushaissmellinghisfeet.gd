#extends Control
#
## Pause state
#var paused: bool = false
#
## Node reference for the pause menu
#@onready var pause_menu = $CanvasLayer/PauseWaitAminuteEushaissmellinghisfeet
#
## Pause input handling
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("pause"):  # Ensure "pause" action is set in Input Map
		#toggle_pause()
#
## Pause menu toggle
#func toggle_pause() -> void:
	#paused = !paused
	#get_tree().paused = paused
#
	#if paused:
		#pause_menu.show()
	#else:
		#pause_menu.hide()
#
## Button functions
#func _on_resume_pressed() -> void:
	#toggle_pause()
#
#func _on_restart_pressed() -> void:
	#get_tree().paused = false
	#get_tree().reload_current_scene()
#
#func _on_return_to_menu_pressed() -> void:
	#get_tree().paused = false
	#get_tree().change_scene_to_file("res://UI Elements/Menu Scren Modified.tscn")




extends Control

# Reference to the main game or scene tree
@onready var main = get_tree()  # Using the scene tree for pause/unpause functionality

# Function triggered when the "Resume" button is pressed
func _on_resume_pressed() -> void:
	main.paused = false  # Unpause the game
	queue_free()  # Close the pause menu

# Function triggered when the "Restart" button is pressed
func _on_restart_pressed() -> void:
	main.paused = false  # Ensure the game is unpaused before restarting
	main.reload_current_scene()  # Restart the current scene

# Function triggered when the "Return to Menu" button is pressed
func _on_return_to_menu_pressed() -> void:
	main.paused = false  # Unpause the game before switching scenes
	#main.change_scene("res://UI Elements/Menu Scren Modified.tscn")  # Replace with your main menu scene path
	main.change_scene_to_file("res://UI Elements/Menu Scren Modified.tscn")



#extends Control
#
## Reference to the main game or scene tree
#@onready var main = get_tree()  # Using the scene tree for pause/unpause functionality
#
## Function triggered when the "Resume" button is pressed
#func _on_resume_pressed() -> void:
	#main.paused = false  # Unpause the game
	#queue_free()  # Close the pause menu
#
## Function triggered when the "Restart" button is pressed
#func _on_restart_pressed() -> void:
	#main.paused = false  # Ensure the game is unpaused before restarting
	#main.reload_current_scene()  # Restart the current scene
#
## Function triggered when the "Return to Menu" button is pressed
#func _on_return_to_menu_pressed() -> void:
	#main.paused = false  # Unpause the game before switching scenes
	#main.change_scene("res://UI Elements/Menu Scren Modified.tscn")  # Replace with your main menu scene path
#
#
#
#
#
#
##extends Control
##
##@onready var main = $"../../"
##
##func _on_resume_pressed() -> void:
	##main.paused
##
##
##
##func _on_restart_pressed() -> void:
	##pass # Replace with function body.
##
##
##
##func _on_return_to_menu_pressed() -> void:
	##pass # Replace with function body.
