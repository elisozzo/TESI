extends Control

#tornare indietro alla schermata iniziale
func _on_indietro_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("premuto indietro")
			$suono_indietro.play(0.0)
			get_tree().change_scene("res://scenes/Int_1.tscn")

