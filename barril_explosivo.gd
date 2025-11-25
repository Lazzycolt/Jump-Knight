extends Objeto 

func AplicarEfecto(personaje) -> void:
	'Lógica: Resta el valor base'
	personaje.RestarPuntos(valor_base*10)
