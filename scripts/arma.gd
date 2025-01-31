extends Area2D

@onready var juego = $".."
var puedo_disparar:bool
var municion_actual:int
var objetivo:Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ocultamos el clic del raton antes de comenzar
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	# Inicializamos las variables necesarias
	puedo_disparar = true
	municion_actual = Global.MUNICION_MAX
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Recarga.wait_time=Global.TIEMPO_RECARGA
	position = get_global_mouse_position()
	puedo_disparar = municion_actual > 0 if true else false
	if Input.is_action_just_pressed("disparar") and puedo_disparar:
		if objetivo:
			juego.otorgar_puntuacion(objetivo.global_position.distance_to(self.global_position), objetivo.radio_colision)
			objetivo.abatido = true
			# Si estamos en modo DIFICIL y abatimos un objetivo recarga automaticamente!!!!!
			if Global.dificultad == 3:
				$Recarga_Sonido.play()
				municion_actual+=1
		municion_actual -= 1
		$Tiro_Sonido.play()
		$Recarga.start()
		
	if not puedo_disparar: 
		$Apariencia.play("descargada")
		$Mira.visible = false
	else: 
		$Apariencia.play("cargada")
		$Mira.visible = true

# Si un objetivo entra en el area de nuestra mira: lo convertimos en nuestro objetivo
func _on_Objetivo_entered(area: Area2D) -> void:
	objetivo = area

# Si el objetivo abandona el area de nuestra mira: convertimos objetivo en nulo
func _on_Objetivo_exited(area: Area2D) -> void:
	objetivo = null

func _on_recarga_timeout() -> void:
	if municion_actual < Global.MUNICION_MAX:
		$Recarga_Sonido.play()
		municion_actual += 1
