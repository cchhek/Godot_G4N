extends Control

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time
func _ready():
	animation_player.play("RESET")
	hide()  # Hide the pause menu at the start

# Toggle pause when ESC is pressed
func _input(event):
	if event.is_action_pressed("esc"):
		toggle_pause()

# Function to toggle pause state
func toggle_pause():
	if get_tree().paused:
		resume()
	else:
		pause()

# Resume the game
func resume():
	get_tree().paused = false
	animation_player.play_backwards("blur")
	await animation_player.animation_finished
	hide()

# Pause the game
func pause():
	get_tree().paused = true
	show()
	animation_player.play("blur")

# Called when the resume button is pressed
func _on_resume_pressed() -> void:
	resume()

# Called when the restart button is pressed
func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

# Called when the menu button is pressed
func _on_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://UI Elements/Menu Scren Modified.tscn")





#extends Control
#
## Called when the node enters the scene tree for the first time
#func _ready():
	#$AnimationPlayer.play("RESET")
#
## Resume the game and stop the pause animation
#func resume():
	#get_tree().paused = false
	#$AnimationPlayer.play_backwards("blur")
	#
## Pause the game and play the blur animation
#func pause():
	#get_tree().paused = true
	#$AnimationPlayer.play("blur")
#
## Check for the ESC key to toggle pause
#func testEsc():
	#if Input.is_action_just_pressed("esc") and !get_tree().paused:
		#pause()
	#elif Input.is_action_just_pressed("esc") and get_tree().paused:
		#resume()
#
## Called when the resume button is pressed
#func _on_resume_pressed() -> void:
	#resume()
#
## Called when the restart button is pressed
#func _on_restart_pressed() -> void:
	## Ensure the game is unpaused before restarting
	#resume()
	#get_tree().reload_current_scene()
#
## Called when the menu button is pressed
#func _on_menu_pressed() -> void:
	## Ensure the game is unpaused before switching scenes
	#resume()
	## Corrected to change the scene to menu screen
	#get_tree().change_scene_to_file("res://UI Elements/Menu Scren Modified.tscn")
#
## Process the input every frame to check for escape key press
#func _process(_delta):
	#if not get_tree().paused:  # Only process input when the game is not paused
		#testEsc()


#extends Control
#
## Called when the node enters the scene tree for the first time
#func _ready():
	#$AnimationPlayer.play("RESET")
#
## Resume the game and stop the pause animation
#func resume():
	#get_tree().paused = false
	#$AnimationPlayer.play_backwards("blur")
	#
## Pause the game and play the blur animation
#func pause():
	#get_tree().paused = true
	#$AnimationPlayer.play("blur")
#
## Check for the ESC key to toggle pause
#func testEsc():
	#if Input.is_action_just_pressed("esc") and !get_tree().paused:
		#pause()
	#elif Input.is_action_just_pressed("esc") and get_tree().paused:
		#resume()
#
## Called when the resume button is pressed
#func _on_resume_pressed() -> void:
	#resume()
#
## Called when the restart button is pressed
#func _on_restart_pressed() -> void:
	#resume()
	#get_tree().reload_current_scene()
#
## Called when the menu button is pressed
#func _on_menu_pressed() -> void:
	## Corrected to change the scene
	#get_tree().change_scene_to_file("res://UI Elements/Menu Scren Modified.tscn")
#
## Process the input every frame to check for escape key press
#func _process(_delta):
	#testEsc()



#extends Control
#
#func _ready():
	#$AnimationPlayer.play("RESET")
#
#
#func resume():
	#get_tree().paused = false
	#$AnimationPlayer.play_backwards("blur")
	#
#func pause():
	#get_tree().paused = true
	#$AnimationPlayer.play("blur")
	#
	#
#func testEsc():
	#if Input.is_action_just_pressed("esc") and !get_tree().paused:
		#pause()
	#
	#elif Input.is_action_just_pressed("esc") and get_tree().paused:
		#resume()
#
#
#func _on_resume_pressed() -> void:
	#resume()
#
#
#func _on_restart_pressed() -> void:
	#resume()
	#get_tree().reload_current_scene()
#
#
#func _on_menu_pressed() -> void:
	#get_tree().change_scene("res://UI Elements/Menu Scren Modified.tscn")
	#
	#
#func _process(_delta):
	#testEsc()
