extends Node

var ANCHO_JUEGO:int
var ALTO_JUEGO:int
const MARGEN_APARICION:int=350
const N_OBJETIVOS_MAX:int=15

const TIPOS_RESOLUCION:Dictionary={
	"1152 x 648":Vector2(1152, 648),
	"1280 x 720":Vector2(1280, 720),
	"1920 x 1080":Vector2(1920, 1080)
}

var musica_principal_menu = AudioStreamPlayer.new()
	
# DIFICULTAD: tenemos 3 dificultades: fácil, medio, díficil
var TIEMPO_PARTIDA:int
var MULTIPLICADOR_PUNTOS:float
var VEL_MOV_OBJETIVO:int
var MUNICION_MAX:int
var TIEMPO_RECARGA:int
var dificultad:int

func _ready() -> void:
	musica_principal_menu.stream=preload("res://assets/sonidos/Main_Theme_Menu.mp3")
	musica_principal_menu.volume_db=-15
	add_child(musica_principal_menu) 
	musica_principal_menu.play()
	
	seleccionar_resolucion(0) # Por defecto: nuestra resolucion es 1152 x 648
	seleccionar_modo_ventana(1) # Por defecto: modo ventana


func seleccionar_dificultad(modo:int) -> void:
	match modo:
		1:
			TIEMPO_PARTIDA=90
			MULTIPLICADOR_PUNTOS=2
			VEL_MOV_OBJETIVO=6
			MUNICION_MAX=7
			TIEMPO_RECARGA=0.5
		2:
			TIEMPO_PARTIDA=60
			MULTIPLICADOR_PUNTOS=1.5
			VEL_MOV_OBJETIVO=9
			MUNICION_MAX=5
			TIEMPO_RECARGA=0.75
		3:
			TIEMPO_PARTIDA=30
			MULTIPLICADOR_PUNTOS=1
			VEL_MOV_OBJETIVO=12
			MUNICION_MAX=3
			TIEMPO_RECARGA=1.5
			
	dificultad=modo

func seleccionar_modo_ventana(modo : int) -> void:
	match modo:
		0: # Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		1: # Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		2: # Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
		3: # Borderless Full-Screen
			DisplayServer. window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
			
func seleccionar_resolucion(indice: int) -> void:
	DisplayServer.window_set_size(TIPOS_RESOLUCION.values()[indice])
	ANCHO_JUEGO = TIPOS_RESOLUCION.values()[indice].x
	ALTO_JUEGO = TIPOS_RESOLUCION.values()[indice].y
	
