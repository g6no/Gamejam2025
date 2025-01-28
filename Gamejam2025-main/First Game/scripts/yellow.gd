extends Area2D

func _on_body_entered(body: Node) -> void:

	queue_free()  # Remove the yellow object
