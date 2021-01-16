extends KinematicBody2D
const GRAVITY = 50
const JUMP_POWER = 1000
const SPEED = 600
const UP = Vector2(0, -1)
var motion = Vector2() #função que recebe índices x e y como parâmetro. Usado 
#para objetos 2D
const DialogNode = preload("res://addons/dialogic/Nodes/dialog_node.gd") # Relative path
onready var dialog_node = DialogNode.new()

func _ready():
	dialog_node.connect("dialogic_signal", self, 'signal_from_dialogic')

func signal_from_dialogic(value):
	print(value + "Aqui foi ativado")
	
func _physics_process(delta): #processamento contínuo da física do objeto 
	#nesse caso jogador) com o delta(leitura de fps) como parâmetro
	if Input.is_action_pressed("ui_cancel"):
	  get_tree().quit()
	
	motion.y += GRAVITY #gravidade
	
	if Input.is_action_pressed("ui_right"): #enquanto pressionar para a direita
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("run")
		
	elif Input.is_action_pressed("ui_left"): #enquanto pressionar para a esquerda
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		motion.x = 0 
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMP_POWER
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion, UP)
