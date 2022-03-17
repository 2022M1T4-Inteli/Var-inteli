extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _on_body_entered(_body: PhysicsBody2D) -> void:
	Global.hardware[2] = 1
	print(Global.hardware)
	anim_player.play("fade_out")
