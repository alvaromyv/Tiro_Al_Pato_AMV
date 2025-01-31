extends Node2D

@onready var almacen = $Almacen

var objetivos_abatidos:int
var objetivos_restantes:int
var tiempo_restante:int
var puntos_jugador:int
var fin:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	Global.musica_principal_menu.stop()
	puntos_jugador = 0 # Al comenzar la partida tenemos 0 puntos
	fin=false
	objetivos_abatidos=0
	objetivos_restantes=0
	$Duracion.wait_time = Global.TIEMPO_PARTIDA
	$Generador.start()
	inicializar_escenario()
	$Duracion.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tiempo_restante = $Duracion.time_left
	if objetivos_restantes<Global.N_OBJETIVOS_MAX and $Generador.is_stopped():
		$Generador.start()

# Genera aleatoriamente los objetivos que aparecerán: Coords Y: 210 (Dianas), 310 y 390 (Patos)
func generar_objetivos_iniciales() -> void:
	for i in range(0, Global.N_OBJETIVOS_INICIAL):
		$Generador.start()
		#add_child(almacen.coger_objetivo())

func _on_generar_enemigo_timeout() -> void:
	add_child(almacen.coger_objetivo())
	
func otorgar_puntuacion(distancia: float, radio_max:int)-> void:
	var puntos_obtenidos=max(0,(Global.MULTIPLICADOR_PUNTOS-distancia/radio_max))*10
	print("Distancia: "+str(distancia)+" | Puntos obtenidos: "+str(puntos_obtenidos))
	puntos_jugador+=puntos_obtenidos
	
# Fin de partida: POR HACER
func _on_duracion_timeout() -> void:
		fin=true
		$Pausa/PantallaFin.visible = true
	

func inicializar_escenario() -> void:
	$"Mar1".z_index = $"Mar1".position.y
	$"Mar2".z_index = $"Mar2".position.y
	$"Mar3".z_index = $"Mar3".position.y
	$"Campo".z_index = $"Campo".position.y
