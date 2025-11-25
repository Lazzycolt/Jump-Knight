extends Objeto 
'''HERENCIA'''

func AplicarEfecto(personaje) -> void:
	'''Lógica: Suma el valor base multiplicado por dos''' 
	var valor_final = valor_base * 2 
	personaje.SumarPuntos(valor_final)
