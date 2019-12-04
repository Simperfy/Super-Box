extends KinematicBody2D

class_name Bullet
	
func _on_WallEnemyCollisionDectector_body_entered(body: PhysicsBody2D) -> void:
	if(typeof(body) == 17):
		body.queue_free()
	queue_free()
	
func _physics_process(delta: float) -> void:
	var projectileVector: = Vector2(1000.0, 0.0)
	move_and_slide(projectileVector)
