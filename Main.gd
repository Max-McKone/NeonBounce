extends Node2D

func _input(event):
	# Check for left mouse click
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		spawn_ball(event.position)

func spawn_ball(pos):
	var ball = RigidBody2D.new()
	ball.position = pos
	
	# Add some "bounciness"
	var physics_material = PhysicsMaterial.new()
	physics_material.bounce = 0.7
	ball.physics_material_override = physics_material
	
	# Create the collision shape
	var collision = CollisionShape2D.new()
	var circle = CircleShape2D.new()
	circle.radius = 15
	collision.shape = circle
	ball.add_child(collision)
	
	# Create the visual element (the "neon" look)
	var visual = ColorRect.new()
	visual.size = Vector2(30, 30)
	visual.position = Vector2(-15, -15)
	
	# Random Neon Color
	var colors = [Color.CYAN, Color.MAGENTA, Color.YELLOW, Color.LIME_GREEN]
	visual.color = colors[randi() % colors.size()]
	
	ball.add_child(visual)
	add_child(ball)
	
	print("Spawned a ball at: ", pos)
