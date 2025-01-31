extends Node

var escena_diana = preload("res://escenas/Diana.tscn")
var escena_pato = preload("res://escenas/Pato.tscn")
#
@onready var juego=$".."
#
var objetivo:Objetivo
#
var coordenadas_y_guia:Array[int]=[190,310,410]
var objetivo_distancia:Array[float]=[0.80,1.0,1.20]
var coordenadas_y_diferencia_alturas:Array[int]=[-40,-20,0]
#
var tamaño_almacen:int=50
var almacen_objetivos:Array[Objetivo]=[]

func _ready()-> void:
	for i in range(0,Global.N_OBJETIVOS_MAX):
		objetivo = generar_objetivo()
		almacen_objetivos.append(objetivo)

func coger_objetivo()-> Objetivo:
	juego.objetivos_restantes+=1
	if not almacen_objetivos.is_empty():
		objetivo = almacen_objetivos.pop_back() # Devolvemos el último objetivo en la cola
		#print("Almacen actual: "+str(almacen_objetivos.size()))
		objetivo.show() # Hacemos visible el objetivo
		objetivo.abatido = false
		objetivo.position = Vector2(0-Global.MARGEN_APARICION, objetivo.position.y) # Reposicionamos
		return objetivo
	else:
		# Si no hay objetivos ya creados, creamos uno nuevo
		objetivo = generar_objetivo()
		return objetivo

func devolver_objetivo(devuelto:Objetivo)-> void:
	juego.objetivos_restantes-=1
	devuelto.position = Vector2(0-Global.MARGEN_APARICION , devuelto.position.y)
	devuelto.hide() # Opcional: Esconde el objetivo mientras no está en uso
	almacen_objetivos.append(devuelto)

	
########################################################################################################
############################ GENERACION OBJETIVOS ######################################################
########################################################################################################

func generar_objetivo()-> Objetivo:
	var n_fila:int
	objetivo = escena_pato.instantiate() if randf() < 0.6 else escena_diana.instantiate()
	if objetivo is Pato: # Si es un pato, esto
		n_fila = randi_range(1, 2) # Filas de los patos
		objetivo.scale = escalar_distancia(n_fila)
	else: # Sino, es una diana
		n_fila = 0 # Fila de la diana
		objetivo.scale = escalar_distancia(n_fila)
	objetivo.position = posicion_aleatoria(n_fila)
	return objetivo
	
# Nos da una posición aleatoria para colocar nuestro objetivo: debemos darle la Y (La fila en la que está colocada el objetivo)
func posicion_aleatoria(n_fila:int)-> Vector2:
	var posicion:Vector2
	posicion.x=0-Global.MARGEN_APARICION 
	posicion.y=coordenadas_y_guia[n_fila]+coordenadas_y_diferencia_alturas[altura_aleatoria()]
	return posicion

# Devuelve un Vector con la escala de X y Y para hacer la impresion de distancia en nuestras filas alejadas
func escalar_distancia(n_fila)-> Vector2:
	return Vector2(objetivo_distancia[n_fila],objetivo_distancia[n_fila])

# La altura a la que se genera nuestro objetivo en función de su línea
func altura_aleatoria() -> int:
	return randi_range(0,coordenadas_y_diferencia_alturas.size()-1)
