extends Control

@onready var btn_modo_ventana = $Opciones/Ventana/btn_cambiar_modo_ventana
@onready var btn_resolucion = $Opciones/Resolucion/btn_cambiar_resolucion

func _ready():
	btn_resolucion.select(0)
	btn_modo_ventana.select(1)
	btn_modo_ventana.item_selected.connect(on_modo_ventana_selected)
	btn_resolucion.item_selected.connect(on_resolucion_item_selected)
		
func on_modo_ventana_selected(indice : int) -> void:
	$Clic.play()
	Global.seleccionar_modo_ventana(indice)

func on_resolucion_item_selected(indice: int) -> void:
	$Clic.play()
	Global.seleccionar_resolucion(indice)
	

func _on_volver_pressed() -> void:
	$Clic.play()
	get_tree().change_scene_to_file("res://escenas/Opciones.tscn")
