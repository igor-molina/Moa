extends Area2D
const DialogNode = preload("res://addons/dialogic/Nodes/dialog_node.gd") # Relative path
onready var dialog_node = DialogNode.new()

func _ready():
	dialog_node.connect("dialogic_signal", self, 'signal_from_dialogic')
	
func signal_from_dialogic(value):
	print(value)

func _on_material_body_entered(body):
	
	
