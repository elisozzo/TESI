extends Node

const file_name = "save.data"
var data = {} #dizionario per caricare le cose da salvare

func _ready():
	load_data()

#caricamento dei dati nel file attraverso il dizionario data
func load_data():
	var file = File.new() #aprire il file
	#controllo se il file esiste
	if file.file_exists("user://" + file_name):
			file.open("user://" + file_name, File.READ)
			data = file.get_var()
			file.close()
	
	else:
		data = {
			"Location_text": {}
		}
#salvataggio dei dati
func save_data():
	var file = File.new()
	file.open("user://" + file_name, File.WRITE)
	file.store_var(data)
	file.close()
