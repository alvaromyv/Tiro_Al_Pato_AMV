extends Objetivo
class_name Pato

var estilo_pato: Array[Texture2D] = [
	preload("res://assets/objetivos/duck_outline_brown.png"),
	preload("res://assets/objetivos/duck_outline_white.png"),
	preload("res://assets/objetivos/duck_outline_yellow.png"),
	preload("res://assets/objetivos/duck_outline_target_yellow.png"),
	preload("res://assets/objetivos/duck_outline_target_white.png"),
	preload("res://assets/objetivos/duck_outline_target_brown.png")
]
var pato_volteado:Texture2D = preload("res://assets/objetivos/duck_outline_back.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	var indice = randi()%estilo_pato.size()
	$Apariencia.texture = estilo_pato[indice]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if abatido:
		$Apariencia.texture = pato_volteado
		$Apariencia.flip_h = true
	super(delta)
