extends AnimatedSprite2D




func _on_grapes_body_entered(body: Node2D) -> void:
	print("+1 grape")
	queue_free()
