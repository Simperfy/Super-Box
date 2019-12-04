extends StaticBody2D

class_name StaticGun



func _on_StaticGunPlayerDetector_body_entered(body: Player):
	body.gun_acquired()
	queue_free()
