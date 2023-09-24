extends Control

#passaggio alla schermata di archivio
func _on_archive_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("premuto archive")
			$suono_archive.play(0.0)
			get_tree().change_scene("res://scenes/Int_3.tscn")
