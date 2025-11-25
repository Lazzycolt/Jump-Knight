extends Area2D
class_name Objeto 

'Atributo que heredan todos los objetos.'
'Se usa export para poder modificarlo fácil desde el Inspector en los hijos'
@export var valor_base: int = 10 

'Método abstracto/polimórfico'
func AplicarEfecto(personaje) -> void:
	
	'Esto evita un error si se intenta usar la clase base directamente.'
	print("Error: Se llamó a AplicarEfecto en la clase base Objeto.")
	pass
