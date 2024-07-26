extends Label

# Variable para almacenar el tiempo transcurrido
var elapsed_time: float = 0.0

# Llamado cuando el nodo entra en la escena por primera vez
func _ready():
	# Iniciamos el texto del Label
	text = "00:00"

# Llamado cada frame. 'delta' es el tiempo transcurrido desde el frame anterior.
func _process(delta: float):
	# Incrementar el tiempo transcurrido
	elapsed_time += delta
	# Actualizar el texto del Label con el tiempo formateado
	text = format_time(elapsed_time)

# Función para formatear el tiempo en hh:mm:ss
func format_time(time: float) -> String:
	var minutes = int(int(time / 60) % 60)
	var seconds = int(int(time) % 60)
	return str(minutes) + ":" + str(seconds)

