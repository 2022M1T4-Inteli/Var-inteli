extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export(String, FILE, "*.tscn") var path_to_scene

func _on_body_entered(_body: Node) -> void:
	change_scene()

func change_scene() -> void:
	if ResourceLoader.exists(path_to_scene):
		get_tree().paused = true
		anim_player.play("fade_in")
		yield(anim_player, "animation_finished")
		var _error = get_tree().change_scene(path_to_scene)
		get_tree().paused = false
