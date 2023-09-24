extends Control


var connection_button = load("res://assets/connection_button.png")
var unconnection_button = load("res://assets/connection_button_opaco.png")
export var connected = true

export var reg = true
var reg_unpressed = load("res://assets/reg.png")
var reg_pressed = load("res://assets/reg_opaco.png")

export var pause = true
var pause_unpressed = load("res://assets/pause.png")
var pause_pressed = load("res://assets/pause_opaco.png")

export var stop = true
var stop_unpressed = load("res://assets/stop.png")
var stop_pressed = load("res://assets/stop_opaco.png")

var reg_action = true
var pause_action = true
var stop_action = true

#funzione per mostrare connection premuto e non
func update_connection():
	if connected:
		print("connected")
		$connection/connection_control/connection_button.texture = connection_button
		$indietro/indietro_control_5/AudioStreamPlayer.play(0.0)
		$reg/reg_control/reg_button.texture = reg_unpressed
		$pause/pause_control/pause_button.texture = pause_unpressed
		$stop/stop_control/stop_button.texture = stop_unpressed
		
	else:
		print("unconnected")
		$connection/connection_control/connection_button.texture = unconnection_button
		$connection/connection_control/audio_connection.play(0.0)

#funzione per mostrare reg premuto e non
func update_reg():
	if reg:
		print("pressed")
		$reg/reg_control/reg_button.texture = reg_pressed
		$indietro/indietro_control_5/AudioStreamPlayer.play(0.0)

	else:
		print("unpressed")
		$reg/reg_control/reg_button.texture = reg_unpressed

#funzione per mostrare pause premuto e non
func update_pause():
	if pause:
		print("pressed")
		$pause/pause_control/pause_button.texture = pause_pressed
		$indietro/indietro_control_5/AudioStreamPlayer.play(0.0)
	else:
		print("unpressed")
		$pause/pause_control/pause_button.texture = pause_unpressed
	
#funzione per mostrare stop premuto e non
func update_stop():
	if stop:
		print("pressed")
		$stop/stop_control/stop_button.texture = stop_pressed
		$indietro/indietro_control_5/AudioStreamPlayer.play(0.0)
	else:
		print("unpressed")
		$stop/stop_control/stop_button.texture = stop_unpressed

#funzione per tornare indietro alla schermata iniziale
func _on_indietro_control_5_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("premuto indietro 5")
			$indietro/indietro_control_5/AudioStreamPlayer.play(0.0)
			get_tree().change_scene("res://scenes/Int_1.tscn")

#se il pulsante connection viene premuto diventa opaco
func _on_connection_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			if connected == false:
				$AnimationPlayer.play_backwards("connessione")
				print("connected pressed")
				connected = true
				update_connection()
			else:
				print("else")
				$AnimationPlayer.play("connessione")
				connected = false
				update_connection()

#se il pulsante reg viene premuto diventa opaco
#se viene premuto un altro pulsante mentre questo
#è opaco si disattiva e si attiva (diventa opaco) quello premuto
func _on_reg_control_gui_input(event):
	if connected == false:
		if reg_action == true:
			if event is InputEventMouseButton:
				if event.get_button_index() == 1 and event.is_pressed():
					
					if pause == false:
						update_pause()
						pause = true
						
					if stop == false:
						update_stop()
						stop = false					
				
					if reg == true:
						print("reg pressed")
						update_reg()
						pause_action = true
						stop_action = true
						reg = false
						
					else:
						print("else")
						update_reg()
						pause_action = true
						stop_action = true
						reg = true
					
#se il pulsante pause viene premuto diventa opaco
#se viene premuto un altro pulsante mentre questo
#è opaco si disattiva e si attiva (diventa opaco) quello premuto
func _on_pause_control_gui_input(event):
	if connected == false:
		if pause_action == true:
			if event is InputEventMouseButton:
					if event.get_button_index() == 1 and event.is_pressed():
						print("pause pressed")
						if reg == false:
							print("qua")
							update_reg()
							reg = true
							
						if stop == false:
							update_stop()
							stop = true
							
						if pause == true:
							print("pause pressed")
							update_pause()
							pause = false
							reg_action = true
							stop_action = true
							
						else:
							print("else")
							update_pause()
							reg_action = true
							stop_action = true
							pause = true

#se il pulsante stop viene premuto diventa opaco
#se viene premuto un altro pulsante mentre questo
#è opaco si disattiva e si attiva (diventa opaco) quello premuto
func _on_stop_control_gui_input(event):
	if connected == false:
		if stop_action == true:
			if event is InputEventMouseButton:
					if event.get_button_index() == 1 and event.is_pressed():
						if reg == false:
							print("qua")
							update_reg()
							reg = true
							
						if pause == false:
							update_pause()
							pause = true
							
						if stop == true:
							print("stop pressed")
							update_stop()
							stop = false
							pause_action = true
							reg_action = true
							
						else:
							print("else")
							update_stop()
							stop = true
							reg_action = true
							pause_action = true
