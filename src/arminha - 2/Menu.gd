extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()
	OS.window_fullscreen = true

func _on_Start_pressed():
	get_tree ().change_scene("res://Node2D.tscn")

#func _on_Option_pressed():
#	var options = load ("").instance()
#	get_tree().current_scene.add_child(options)

func _on_Quit_pressed():
	get_tree().quit()
