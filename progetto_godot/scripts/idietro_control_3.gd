extends Control

#tornare indietro alla schermata iniziale
func _on_idietro_control_3_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("premuto indietro 3")
			$AudioStreamPlayer.play(0.0)
			get_tree().change_scene("res://scenes/Int_1.tscn")

