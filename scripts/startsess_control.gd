extends Control

#passaggio alla schermata di start session
func _on_startsess_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("premuto start session")
			$suono_startsession.play(0.0)
			get_tree().change_scene("res://scenes/Int_5.tscn")
