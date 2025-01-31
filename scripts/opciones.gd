extends Control

@onready var lbl_volumen = $VBoxContainer/lbl_volumen
@onready var volumen = $VBoxContainer/sld_volumen

func _ready() -> void:
	# Inicializamos el slider con el volumen actual del bus Master
	volumen.value=AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	actualizar_etiqueta_volumen(volumen.value)

func _on_resolución_pressed() -> void:
	$Clic.play()
	get_tree().change_scene_to_file("res://escenas/Resolucion.tscn")

func _on_volver_pressed() -> void:
	$Clic.play()
	get_tree().change_scene_to_file("res://escenas/Menu.tscn")

# Cambiamos el volumen global cuando se ajusta el deslizador
func _on_sld_volumen_value_changed(value: float) -> void:
	# Establecemos el volumen del bus Master (Global)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	actualizar_etiqueta_volumen(value)
	
func actualizar_etiqueta_volumen(valor: float)->void:
	lbl_volumen.text="Volumen: "+str(valor+100)
	
