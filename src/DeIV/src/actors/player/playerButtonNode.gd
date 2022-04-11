extends Node2D


func _ready():
	pass
	
# Called when the node enters the scene tree for the first time.
func _process(_delta):
#	if global.anafase3 == true:

	if global.count == 10:
		$CanvasPanel/Panel/Jump.disabled = true 
		$CanvasPanel/Panel/Right.disabled = true
		$CanvasPanel/Panel/Left.disabled = true
	if global.enable == true:
		$CanvasPanel/Panel/Jump.disabled = false 
		$CanvasPanel/Panel/Right.disabled = false
		$CanvasPanel/Panel/Left.disabled = false
	
	if global.pontosfase04 == 0:
		$CanvasLabel/Label.text = ("0/4")
	elif global.pontosfase04 == 1:
		$CanvasLabel/Label.text = ("1/4")
	elif global.pontosfase04 == 2:
		$CanvasLabel/Label.text = ("2/4")
	elif global.pontosfase04 == 3:
		$CanvasLabel/Label.text = ("3/4")
	elif global.pontosfase04 == 4:
		$CanvasLabel/Label.text = ("4/4")
	


