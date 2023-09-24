extends Node

const file_name = "save__archive.data"
var archive_data = {} #dizionario per caricare le cose da salvare
var archive_array = []

func _ready():
	load_data()

#caricamento dei dati nel file attraverso il dizionario archive_data
func load_data():
	var file = File.new() #aprire il file
	#controllo se il file esiste
	if file.file_exists("user://" + file_name):
			file.open("user://" + file_name, File.READ)
			archive_data = file.get_var()
			file.close()
	
	else:
		archive_data = {
			"Position": {}
		}
#salvataggio dei dati
func save_data():
	var file = File.new()
	file.open("user://" + file_name, File.WRITE)
	file.store_var(archive_data)
	file.close()

