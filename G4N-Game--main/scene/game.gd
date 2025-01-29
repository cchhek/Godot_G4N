#extends Node2D
#
#@onready var PauseMenu = $CanvasLayer/PauseWaitAminuteEushaissmellinghisfeet
#var paused = false
#
#func _process(_delta):
	#if Input.is_action_just_pressed("esc"):
		#pauseMenu()
#
#func pauseMenu():
	## Check if PauseMenu node is still valid before trying to use it
	#if PauseMenu and is_instance_valid(PauseMenu):
		#if paused:
			#PauseMenu.hide()
			#Engine.time_scale = 1  # Unpause the game
		#else:
			#PauseMenu.show()
			#Engine.time_scale = 0  # Pause the game
	#
		#paused = !paused
	#else:
		#print("Error: PauseMenu node is missing or has been freed.")





extends Node2D

@onready var PauseMenu = $CanvasLayer/PauseMenu
var paused = false

func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()

func pauseMenu():
	if paused:
		PauseMenu.hide()
		Engine.time_scale = 1 
	else:
		PauseMenu.show()
		Engine.time_scale = 0 
	
	paused = !paused 				
