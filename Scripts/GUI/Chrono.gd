extends PanelContainer

@onready var label = $Label
var elapsed_time: float = 0.0

func _ready():
	label.text = "00:00"

func _process(delta: float):
	elapsed_time += delta
	label.text = format_time(elapsed_time)
	
func format_time(time: float) -> String:
	var minutes = int(int(time / 60) % 60)
	var seconds = int(int(time) % 60)
	return ("%02d" % minutes) + (":%02d" % seconds)

