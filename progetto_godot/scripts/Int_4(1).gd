extends Control

var editable = false
var new_text = ""

#comparsa del popup se si preme il delete
func _on_delete_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			$delete_control/audio_delete.play(0.0)
			$AnimationPlayer.play("popup")
			print("POPUP")

#se si preme ok nel popup si torna alla schermata precedente					
func _on_ok_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			$AnimationPlayer/popup/ok/audio_ok.play(0.0)
			Global.Int = 1
			print("provendo da Int_4(1)")
			get_tree().change_scene("res://scenes/Int_3.tscn")
			
#se si preme cancel nel popup si rimane nella schermata attuale
func _on_cancel_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			$AnimationPlayer/popup/cancel/audio_cancel.play(0.0)
			$AnimationPlayer.play_backwards("popup")

func _ready():
	if DataManager.data["Location_text"].has(name):
		$VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.text = DataManager.data["Location_text"][name]
	print("QUI: " + str(DataManager.data["Location_text"]))	
	
	$VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.set_virtual_keyboard_enabled(false)
	$VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.set_selecting_enabled(false)

#premere edit per modificare il testo di location
func _on_edit_control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			editable = true
			print("editable") 
			$edit/edit_control/audio_edit.play(0.0)
			$VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.set_readonly(false)
			
			#mostra keyboard solo se viene premuto edit
			OS.show_virtual_keyboard($VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.text, true)
			$VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.set_selecting_enabled(true)

#premere il body dell'interfaccia per nascondere la keyboard e ritornare in readonly
#senza poter più modificare la location se non ripremendo edit
func _on_body_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("body pressed")
			OS.hide_virtual_keyboard()
			$VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.set_readonly(true)
			print($VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.is_readonly())
			print($VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.text)
			_on_location_testo_text_changed()

func _on_location_testo_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.is_pressed():
			print("non posso usare tastiera")
			if $VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.is_readonly():
				OS.hide_virtual_keyboard()
				
#se viene cambiato il testo della location dev'essere salvato nel dizionario data di DataManager				
func _on_location_testo_text_changed():
	new_text = $VBoxContainer/Control/HBoxContainer/Control/HBoxContainer/location_testo.text
	DataManager.data["Location_text"][name] = new_text
	DataManager.save_data()


