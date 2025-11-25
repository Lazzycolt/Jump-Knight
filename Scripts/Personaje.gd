extends Area2D
class_name Personaje

'Señal para puntuacion'
signal puntuacion_cambiada(nueva_puntuacion: int)

'--- Atributos Encapsulados ---'
var puntuacion: int = 0
var velocidad_salto: float = 600.0
var gravedad: float = 1200.0 

var _esta_saltando: bool = false
var _velocidad_y: float = 0.0

'--- Métodos de la POO (Encapsulamiento) ---'

func SumarPuntos(valor: int) -> void:
	puntuacion += valor
	print("Puntuación actual: %s" % puntuacion)
	puntuacion_cambiada.emit(puntuacion)

func RestarPuntos(valor: int) -> void:
	puntuacion -= valor
	print("Puntuación actual: %s" % puntuacion)
	puntuacion_cambiada.emit(puntuacion)

'--- Lógica de Movimiento ---'

# Necesitamos un nodo de referencia en la escena principal para saber dónde está el "suelo"
@onready var _suelo_y: float = 0.0 # Se setea en la escena principal

func _physics_process(delta: float) -> void:
	if _esta_saltando:
		_velocidad_y += gravedad * delta
		position.y += _velocidad_y * delta
		
		# Aterrizar
		if position.y >= _suelo_y:
			position.y = _suelo_y 
			_esta_saltando = false
			_velocidad_y = 0

func Saltar() -> void:
	if not _esta_saltando:
		_esta_saltando = true
		_velocidad_y = -velocidad_salto 

'--- Detección de Colisión ---'
func _on_area_entered(area: Area2D) -> void:
	'--- Verificamos si el cuerpo es una instancia de nuestra clase Objeto base ---'
	if area is Objeto: 
		var objeto_agarrado: Objeto = area as Objeto
		objeto_agarrado.AplicarEfecto(self) 
		'Destruir el objeto'
		objeto_agarrado.queue_free()
	else:
		print("test")
