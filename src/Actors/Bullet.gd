extends KinematicBody2D

class_name Bullet
	
func _on_WallCollisionDectector_body_entered(body: PhysicsBody2D) -> void:
	print(body)
	queue_free()
	
func _physics_process(delta: float) -> void:
	var projectileVector: = Vector2(1000.0, 0.0)
	move_and_slide(projectileVector)
