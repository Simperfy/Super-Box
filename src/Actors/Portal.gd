extends StaticBody2D

class_name Portal

signal level_cleared

func _on_PortalPlayerDetector_body_entered(body: KinematicBody2D) -> void:
	emit_signal("level_cleared")
