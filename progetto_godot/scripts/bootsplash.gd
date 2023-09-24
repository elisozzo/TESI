extends Control

	#$callas.play(0.0)

#passaggio a prima interfaccia al timeout
func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/Int_1.tscn")

func _on_Timer3_timeout():
	$battito.play("battito")

func _on_Timer2_timeout():
	$battito.stop(true)



