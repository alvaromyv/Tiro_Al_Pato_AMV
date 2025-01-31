extends Control

func _on_facil_pressed() -> void:
	$Clic.play()
	Global.seleccionar_dificultad(1)
	get_tree().change_scene_to_file("res://escenas/juego.tscn")


func _on_media_pressed() -> void:
	$Clic.play()
	Global.seleccionar_dificultad(2)
	get_tree().change_scene_to_file("res://escenas/juego.tscn")


func _on_dificil_pressed() -> void:
	$Clic.play()
	Global.seleccionar_dificultad(3)
	get_tree().change_scene_to_file("res://escenas/juego.tscn")
	
func _on_volver_pressed() -> void:
	$Clic.play()
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
