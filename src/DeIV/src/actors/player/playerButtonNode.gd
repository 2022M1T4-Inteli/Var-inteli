extends Node2D



# Called when the node enters the scene tree for the first time.
func _process(delta):
	if global.anafase3 == true:
		$CanvasPanel/Panel.visible = true
		$CanvasLayer/painelControle.visible = true
		$CanvasLayer/telaPC.visible = true
		$CanvasLayer/Clear.visible = true
	if global.count == 10:
		$CanvasPanel/Panel/Jump.disabled = true 
		$CanvasPanel/Panel/Right.disabled = true
		$CanvasPanel/Panel/Left.disabled = true
	if global.enable == true:
		$CanvasPanel/Panel/Jump.disabled = false 
		$CanvasPanel/Panel/Right.disabled = false
		$CanvasPanel/Panel/Left.disabled = false
