extends Control

var pausado:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pausado = false
	visible = false
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pausa"):
		pausado = not pausado
		get_tree().paused = not get_tree().paused
		visible = not visible
		
	if pausado:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_btn_continuar_pressed() -> void:
	$Clic.play()
	get_tree().paused = false
	pausado = false
	visible = false


func _on_btn_salir_pressed() -> void:
	$Clic.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://escenas/Menu.tscn")
