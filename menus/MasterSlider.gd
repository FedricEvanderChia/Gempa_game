extends HSlider

@export var bus_name: String
var bus_idx: int
# Called when the node enters the scene tree for the first time.
func _ready():
	bus_idx = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_idx))
	
func _on_value_changed(value: float):
	AudioServer.set_bus_volume_db(bus_idx,linear_to_db(value))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
