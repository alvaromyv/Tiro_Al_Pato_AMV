extends Objetivo
class_name Diana

var estilo_diana: Array[Texture2D] = [
	preload("res://assets/objetivos/target_colored_outline.png"),
	preload("res://assets/objetivos/target_red1_outline.png"),
	preload("res://assets/objetivos/target_red2_outline.png"),
	preload("res://assets/objetivos/target_red3_outline.png"),
	preload("res://assets/objetivos/target_white_outline.png")
]

var diana_volteada:Texture2D = preload("res://assets/objetivos/target_back_outline.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	var indice = randi()%estilo_diana.size()
	$Apariencia.texture = estilo_diana[indice]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if abatido:
		$Apariencia.texture = diana_volteada
	super(delta)
