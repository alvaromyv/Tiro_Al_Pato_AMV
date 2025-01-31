extends Area2D
class_name Objetivo

@onready var almacen=get_node("/root/Juego/Almacen")
@onready var juego=get_node("/root/Juego")

var abatido:bool
var radio_colision:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index=position.y
	radio_colision=$CollisionShape2D.shape.radius
	abatido=false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Ajusta la posición: salgo por un extremo -> entro por el otro
	if position.x>Global.ANCHO_JUEGO+Global.MARGEN_APARICION:
		almacen.devolver_objetivo(self)
	# Desplaza automaticamente el objetivo horizontalmente a la velocidad que definamos
	position.x+=Global.VEL_MOV_OBJETIVO;
	
	if abatido:
		juego.objetivos_abatidos+=1
		juego.objetivos_restantes-=1
		abatido = false # Para evitar la repeticion frame por frame
		await get_tree().create_timer(0.3).timeout
		self.queue_free()
