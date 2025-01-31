extends Control

@onready var panel_municion=$Municion
@onready var lbl_tiempo_restante=$Tiempo/lbl_tiempo_restante
@onready var lbl_contador_abatidos=$Abatidos/lbl_contador_abatidos
@onready var lbl_puntos_conseguidos=$Puntuacion/lbl_contador_puntos
@onready var lbl_dificultad_elegida=$Dificultad/lbl_dificultad_elegida
@onready var arma = $"../../Arma"
@onready var juego = $"../.."

var bala_cargada:Texture2D=preload("res://assets/hud/icon_bullet_gold_long.png")
var bala_vacia:Texture2D=preload("res://assets/hud/icon_bullet_empty_long.png")

var cargador_municion:Array[TextureRect] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inicializar_panel_municion()
	texto_dificultad_elegida()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	actualizar_panel_municion()
	actualizar_contador_abatidos()
	actualizar_contador_tiempo_restante()
	actualizar_puntos_conseguidos()
	

func inicializar_panel_municion() -> void:
	cargador_municion.resize(Global.MUNICION_MAX)
	for bala in cargador_municion.size():
		cargador_municion[bala] = TextureRect.new()
		cargador_municion[bala].texture=bala_cargada
		panel_municion.add_child(cargador_municion[bala])

func actualizar_panel_municion() -> void:
	for bala in range(0,cargador_municion.size()):
		if bala < arma.municion_actual:
			cargador_municion[bala].texture=bala_cargada
		else:
			cargador_municion[bala].texture=bala_vacia
			
func actualizar_contador_tiempo_restante() -> void:
	lbl_tiempo_restante.text = str(juego.tiempo_restante)

func actualizar_contador_abatidos() -> void:
	lbl_contador_abatidos.text = str(juego.objetivos_abatidos)

func actualizar_puntos_conseguidos() -> void:
	lbl_puntos_conseguidos.text = str(juego.puntos_jugador)
	
func texto_dificultad_elegida():
	match Global.dificultad:
		1:
			lbl_dificultad_elegida.text = "FACIL"
		2:
			lbl_dificultad_elegida.text = "MEDIA" 
		3:
			lbl_dificultad_elegida.text = "DIFICIL"
