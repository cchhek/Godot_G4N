class_name Player
extends CharacterBody2D

# Direction and movement variables
var cardinal_direction: Vector2 = Vector2.DOWN
const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]
var direction: Vector2 = Vector2.ZERO
var input_velocity: Vector2 = Vector2.ZERO  # Replacing "velocity" to avoid conflicts
var speed: float = 200.0  # Player movement speed

# Health variables
var health: int = 100
var max_health: int = 100

# Node references
@onready var health_bar = $ProgressBar
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

# Signals
signal DirectionChanged(new_direction: Vector2)

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	PlayerManager.player = self
	state_machine.Initialize(self)
	print("Player is ready")  # Debugging log

# Process input every frame
func _process(_delta: float) -> void:
	if not get_tree().paused:  # Only process input if the game is not paused
		direction = Vector2(
			Input.get_axis("left", "right"),
			Input.get_axis("up", "down")
		).normalized()
		input_velocity = direction * speed  # Calculate movement velocity

# Physics processing for movement
func _physics_process(_delta: float) -> void:
	if not get_tree().paused:  # Only move if the game is not paused
		self.velocity = input_velocity  # Assign calculated velocity to the built-in property
		move_and_slide()  # Call without arguments
		SetDirection()  # Update direction if necessary

# Calculate the index of the current direction
func calculate_direction_index(input_direction: Vector2, reference_direction: Vector2, dir_size: int) -> int:
	var direction_bias = 0.1
	var angle = (input_direction + reference_direction * direction_bias).angle()
	var normalized_angle = angle / TAU
	var direction_idx = int(round(normalized_angle * dir_size)) % dir_size  # Ensure index wraps
	return direction_idx

# Update the current cardinal direction
func SetDirection() -> bool:
	if direction == Vector2.ZERO:
		return false

	var direction_idx: int = calculate_direction_index(direction, cardinal_direction, DIR_4.size())
	var new_dir = DIR_4[direction_idx]

	if new_dir == cardinal_direction:
		return false

	cardinal_direction = new_dir
	emit_signal("DirectionChanged", new_dir)
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	print("Cardinal direction changed to: ", cardinal_direction)  # Debugging log
	return true

# Update animation based on state
func UpdateAnimation(state: String) -> void:
	animation_player.play(state + "_" + AnimDirection())

# Get the animation direction string
func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

# Handle taking damage
func take_damage(amount: int) -> void:
	health -= amount
	health = clamp(health, 0, max_health)
	update_health_bar()
	print("Health: ", health)  # Debugging log
	if health <= 0:
		die()

# Update the health bar
func update_health_bar() -> void:
	if health_bar:
		health_bar.value = health

# Handle player death
func die() -> void:
	print("Player has died")  # Debugging log
	
	# Switch to the Game Over scene
	get_tree().change_scene_to_file("res://UI Elements/game_over.tscn")

	
	## Load the Game Over scene
	#var game_over_scene = preload("res://UI Elements/game_over.tscn")  # Adjust the path to your Game Over scene
	#var game_over_instance = game_over_scene.instantiate()
	#
	## Add the Game Over scene to the tree
	#get_tree().root.add_child(game_over_instance)
	#
	## Pause the game
	#get_tree().paused = true
	#
	## Free the player instance
	#queue_free()
#





#class_name Player extends CharacterBody2D
#
#var cardinal_direction : Vector2 = Vector2.DOWN
#const DIR_4 = [ Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP ]
#var direction : Vector2 = Vector2.ZERO
#
#var health: int = 100
#var max_health: int = 100
#
#@onready var health_bar = $ProgressBar
#
#@onready var animation_player : AnimationPlayer = $AnimationPlayer
#@onready var sprite : Sprite2D = $Sprite2D
#@onready var state_machine : PlayerStateMachine = $StateMachine
#
#signal DirectionChanged( new_direction: Vector2 )
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#PlayerManager.player = self
	#state_machine.Initialize(self)
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
	##direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	##direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	#direction = Vector2(
		#Input.get_axis("left", "right"),
		#Input.get_axis("up","down")
	#).normalized()
	#pass
#
#func _physics_process(_delta):
	#move_and_slide()
	#
#func calculate_direction_index(input_direction: Vector2, reference_direction: Vector2, dir_size: int) -> int:
	#var direction_bias = 0.1
	#var angle = (input_direction + reference_direction * direction_bias).angle()
	#var normalized_angle = angle / TAU
	#var direction_idx = int(round(normalized_angle * dir_size))
	#return direction_idx
	#
#func SetDirection() -> bool :
	#if direction == Vector2.ZERO:
		#return false
	#
	#var direction_idx: int = calculate_direction_index(direction, cardinal_direction, DIR_4.size())
	#var new_dir = DIR_4[ direction_idx ]
	#
	#if new_dir == cardinal_direction:
		#return false
		#
	#cardinal_direction = new_dir
	#DirectionChanged.emit(new_dir)
	#sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	#return true
#
#
#func UpdateAnimation(state : String) -> void:
	#animation_player.play( state + "_" + AnimDirection())
	#pass
#
#func AnimDirection() -> String:
	#if cardinal_direction == Vector2.DOWN:
		#return "down"
	#elif cardinal_direction == Vector2.UP:
		#return "up"
	#else:
		#return "side"
#
#func take_damage(amount: int) -> void:
	#health -= amount
	#health = clamp(health, 0, max_health)
	#update_health_bar()
	#if health <= 0:
		#die()
#
#func update_health_bar() -> void:
	#if health_bar:
		#health_bar.value = health
#
#func die() -> void:
	#queue_free()
