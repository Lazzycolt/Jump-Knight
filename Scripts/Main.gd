extends Node2D

const OBJETO_DORADO_SCENE = preload("res://Escenas/ObjetoDorado.tscn")
const OBJETO_MALO_SCENE = preload("res://Escenas/ObjetoMalo.tscn")
const OBJETO_BARRIL = preload("res://Escenas/barril_explosivo.tscn")
var _objetos_a_generar: Array = [OBJETO_DORADO_SCENE, OBJETO_MALO_SCENE,OBJETO_BARRIL]

@onready var _personaje: Personaje = $Personaje
@onready var _posicion_generacion: Marker2D = $PosicionGeneracion
@onready var _contador_puntos: Label = $CanvasLayer/ContadorPuntos

func _ready() -> void:
	'Configuramos la altura del suelo en el Personaje al inicio'
	'Asumimos que la posición Y del personaje es el suelo'
	_personaje._suelo_y = _personaje.position.y
	_personaje.puntuacion_cambiada.connect(_actualizar_puntos)
	'Inicializar el contador'
	_actualizar_puntos(_personaje.puntuacion)

func _input(event: InputEvent) -> void:
	'1. Detectar el Salto (tecla Espacio)'
	if event.is_action_pressed("ui_accept"): 
		_personaje.Saltar()

	'2. Detectar el Clic (botón primario del ratón)'
	if event.is_action_pressed("click_izquierdo"): 
		GenerarObjeto()

func GenerarObjeto() -> void:
	'Elegimos un objeto al azar'
	var objeto_scene = _objetos_a_generar.pick_random()
	
	'Instanciar el objeto. podemos castearlo a la clase Objeto'
	var nuevo_objeto: Objeto = objeto_scene.instantiate() as Objeto 
	
	'Posicionar encima del personaje'
	nuevo_objeto.global_position = _posicion_generacion.global_position
	
	'Añadir a la escena principal'
	add_child(nuevo_objeto)

	'Función que recibe la señal y actualiza el Label'
func _actualizar_puntos(nueva_puntuacion: int) -> void:
	_contador_puntos.text = "Puntos: %s" % nueva_puntuacion
