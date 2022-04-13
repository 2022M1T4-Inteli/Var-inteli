extends Control


func _ready():
	$TextureRect/VBoxContainer/StartButton.grab_focus()


func _on_StartButton_pressed() -> void:
	get_tree().change_scene('res://src/levels/hub.tscn')

func _on_OptionsButton_pressed() -> void:
	get_tree().change_scene("res://src/menus/optionsMenu/optionsMenu.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)

