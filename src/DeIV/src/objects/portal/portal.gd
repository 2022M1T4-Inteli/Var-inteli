tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

# Possibilita linkar o portal com outras cenas em precisar editar o código
export(String, FILE, "*.tscn") var path_to_scene


func _on_body_entered(_body: Node) -> void:
	change_scene()
	

# Executa uma animação e depois troca de cena
func change_scene() -> void:
	if ResourceLoader.exists(path_to_scene):
		get_tree().paused = true
		anim_player.play("fade_in")
		yield(anim_player, "animation_finished")
		get_tree().change_scene(path_to_scene)
		get_tree().paused = false
		

func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not path_to_scene else ""
