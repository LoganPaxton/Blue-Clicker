extends Panel

@export var CONTROL_NODE : Control
@export var REBIRTH_MULTI : float = 1.0

@onready var PARAGRAPH : Label = $Paragrah

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_yes_pressed():
	PARAGRAPH.text = "If you rebirth you will get a x%s boost!
But, be warned rebirthing resets all of your progress!" % REBIRTH_MULTI
	visible = false
	CONTROL_NODE.REBIRTHING = true


func _on_no_pressed():
	visible = false
	
