extends Node2D
	
func _physics_process(delta):
	
	if $Player.position.y > 1000:
		$Player.position = $StartPosition.position



func _on_Ghost_body_entered(body: Player):
	if body is Player:
		body.position = $StartPosition.position
