extends TextureRect

#tornare indietro alla schermata di archivio
func _on_indietro_control_4_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("premuto indietro 3")
			$HBoxContainer/indietro_control_4/AudioStreamPlayer.play(0.0)
			get_tree().change_scene("res://scenes/Int_3.tscn")

