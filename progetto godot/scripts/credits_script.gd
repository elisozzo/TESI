extends Control

#passaggio alla schermata dei credits
func _on_credits_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("premuto avanti")
			$suono_credits.play(0.0)
			get_tree().change_scene("res://scenes/Int_2.tscn")
			
