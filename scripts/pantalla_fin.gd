extends Control

@onready var lbl_contador_puntos=$VBoxContainer/lbl_contador_puntos
@onready var juego=$"../.."

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if juego.fin:
		actualizar_puntos_obtenidos()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
	
func _on_btn_reiniciar_pressed() -> void:
	$Clic.play()
	get_tree().paused=false
	get_tree().change_scene_to_file("res://escenas/Juego.tscn")

func _on_btn_volver_pressed() -> void:
	$Clic.play()
	get_tree().paused=false
	get_tree().change_scene_to_file("res://escenas/Menu.tscn")
	
func actualizar_puntos_obtenidos()-> void:
	lbl_contador_puntos.text = str(juego.puntos_jugador)+" PTS"
