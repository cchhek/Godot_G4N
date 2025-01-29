class_name Bubble extends Node2D

@export var enemy_scene1 = preload("res://scene/ghost.tscn")
@export var enemy_scene2 = preload("res://scene/critter.tscn")
@export var enemy_scene3 = preload("res://Enemies/Creep/creep.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the damaged signal from the HitBox to the TakeDamage function
	$HitBox.Damaged.connect(TakeDamage)

func TakeDamage(_damage: int) -> void:
	print("Bubble destroyed")
	spawn_random_enemy()  # Spawn a random enemy when the bubble is destroyed
	$HitBox.queue_free()  # Free the HitBox immediately
	call_deferred("queue_free")  # Defer the freeing of the Bubble node to the next frame
	
func spawn_random_enemy():
	var random_choice = randi() % 4  # 0: Nothing, 1: Enemy1, 2: Enemy2, 3: Enemy3
	var enemy_instance = null

	# Based on the random choice, instantiate the corresponding enemy scene
	match random_choice:
		1:
			enemy_instance = enemy_scene1.instantiate()
		2:
			enemy_instance = enemy_scene2.instantiate()
		3:
			enemy_instance = enemy_scene3.instantiate()

	# If an enemy was instantiated, set its position to the Bubble's position and add it to the scene
	if enemy_instance:
		enemy_instance.position = self.position
		# Use call_deferred to avoid modifying physics states during queries
		call_deferred("add_enemy_to_parent", enemy_instance)

	# Clear the reference to the enemy instance
	enemy_instance = null

# This function is deferred so it doesn't conflict with physics state changes
func add_enemy_to_parent(enemy_instance):
	get_parent().add_child(enemy_instance)



#class_name Bubble extends Node2D
#
#@export var enemy_scene1 = preload("res://scene/ghost.tscn")
#@export var enemy_scene2 = preload("res://scene/critter.tscn")
#@export var enemy_scene3 = preload("res://Enemies/Creep/creep.tscn")
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	## Connect the damaged signal from the HitBox to the TakeDamage function
	#$HitBox.Damaged.connect(TakeDamage)
#
#func TakeDamage(_damage: int) -> void:
	#print("Bubble destroyed")
	#spawn_random_enemy()  # Spawn a random enemy when the bubble is destroyed
	#$HitBox.queue_free()  # Free the HitBox immediately
	#call_deferred("queue_free")  # Defer the freeing of the Bubble node to the next frame
	#
#func spawn_random_enemy():
	#var random_choice = randi() % 4  # 0: Nothing, 1: Enemy1, 2: Enemy2, 3: Enemy3
	#var enemy_instance = null
#
	## Based on the random choice, instantiate the corresponding enemy scene
	#match random_choice:
		#1:
			#enemy_instance = enemy_scene1.instantiate()
		#2:
			#enemy_instance = enemy_scene2.instantiate()
		#3:
			#enemy_instance = enemy_scene3.instantiate()
#
	## If an enemy was instantiated, set its position to the Bubble's position and add it to the scene
	#if enemy_instance:
		#enemy_instance.position = self.position
		#get_parent().add_child(enemy_instance)
	#
	## Clear the reference to the enemy instance
	#enemy_instance = null




#class_name Bubble extends Node2D
#
#@export var enemy_scene1 = preload("res://scene/ghost.tscn")
#@export var enemy_scene2 = preload("res://scene/critter.tscn")
#@export var enemy_scene3 = preload("res://Enemies/Creep/creep.tscn")
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#$HitBox.Damaged.connect( TakeDamage )
	#pass # Replace with function body.
#
#
#func TakeDamage( _damage: int) -> void:
	#print("Bubble destroyed")
	#spawn_random_enemy()
	#$HitBox.queue_free()
	#queue_free()
	#
	#pass
#
#func spawn_random_enemy():
	#var random_choice = randi() % 4 # 0: Nothing, 1: Enemy1, 2: Enemy2
	#var enemy_instance = null
#
	#match random_choice:
		#1:
			#enemy_instance = enemy_scene1.instantiate()
		#2:
			#enemy_instance = enemy_scene2.instantiate()
		#3:
			#enemy_instance = enemy_scene3.instantiate()
#
	#if enemy_instance:
		#enemy_instance.position = self.position
		#get_parent().add_child(enemy_instance)
	#
	#enemy_instance = null
