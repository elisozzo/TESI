extends Control

var button = -1
var pos_array = []
var x = 0

func _ready(): 

	if SaveArchive.archive_data["Position"].empty() == false:
			Global.array = SaveArchive.archive_data["Position"]
			
	button_generator()
	
#funzione che crea in maniera dinamica i pulsanti
func button_generator():	
	#pos_array popolato con tutte le posizioni dei pulsanti
	for j in range (0,Global.array.size()):
		var pos = Vector2(115, 635+j*226) 
		pos_array.append(pos)
		
	for i in range(0, 4): 
		
		#creazione dei pulsanti e inserimento della posizione
		#di questi in archive_array per il salvataggio
		
		if i != Global.Int and Global.array.has(i) == true:
			var r = Button.new()  
			r.rect_min_size = Vector2(846, 226)   
			r.rect_position = pos_array[x]
			SaveArchive.archive_array.append(r.rect_position)
			
			var name = "res://assets/item" + str(i+1) + ".png" 
			r.icon = load(name)
			r.set_expand_icon(true)  
			r.set_icon_align(1)
			r.set("custom_styles/normal",StyleBoxEmpty.new())
			r.set("custom_styles/hover",StyleBoxEmpty.new())
			r.set("custom_styles/focus",StyleBoxEmpty.new())
			r.set("custom_styles/pressed",StyleBoxEmpty.new())
			
			add_child(r)
			r.connect("pressed", self, "_on_Button" + str(i) + "_pressed")
			x += 1
	
	#Quando viene premuto il delete di un pulsante viene cancellato 
	#e si arricchisce il dizionario di SaveArchive con le modifiche effettuate 	
	
	if Global.Int != 4:
		Global.array.erase(Global.Int)
		SaveArchive.archive_data["Position"] = Global.array
		SaveArchive.save_data()

#funzioni per passare ad interfaccia successiva in base al pulsante premuto
func _on_Button0_pressed():
	button = 0
	print("premuto button " + str(button))
	$avanti.play(0.0)
	get_tree().change_scene("res://scenes/Int_4.tscn")

func _on_Button1_pressed():
	button = 1
	print("premuto button " + str(button))
	$avanti.play(0.0)
	get_tree().change_scene("res://scenes/Int_4(1).tscn")
	
func _on_Button2_pressed(): 
	button = 2
	print("premuto button " + str(button))
	$avanti.play(0.0)
	get_tree().change_scene("res://scenes/Int_4(2).tscn")
	
func _on_Button3_pressed():
	button = 3
	print("premuto button " + str(button))
	$avanti.play(0.0)
	get_tree().change_scene("res://scenes/Int_4(3).tscn")
