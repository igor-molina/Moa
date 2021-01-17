extends Sprite

var boat = preload("res://assets/elements/boat.png")
const DialogNode = preload("res://addons/dialogic/Nodes/dialog_node.gd") # Relative path
onready var dialog_node = DialogNode.new()

func _ready():
	dialog_node.connect("dialogic_signal", self, 'signal_from_dialogic')

func signal_from_dialogic(value):
	if value == "construir":
		boat.set_texture(boat)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
