extends Control

func _process(delta: float) -> void:
	if not Global.musica_principal_menu.is_playing():
		Global.musica_principal_menu.play()

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/dificultad.tscn")
	$Click.play()


func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/opciones.tscn")
	$Click.play()


func _on_salir_pressed() -> void:
	$Click.play()
	get_tree().quit()
