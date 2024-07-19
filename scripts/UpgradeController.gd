extends Panel

@export var CONTROL_NODE : Node
@export var REBIRTH_PROMPT : Panel

@onready var upgrade1 = $Upgrade1
@onready var upgrade2 = $Upgrade2
@onready var rebirth = $Rebirth

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect button signals
	upgrade1.connect("pressed", Callable(self, "_on_upgrade_1_pressed"))
	upgrade2.connect("pressed", Callable(self, "_on_upgrade_2_pressed"))
	rebirth.connect("pressed", Callable(self, "_on_rebirth_pressed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var points = CONTROL_NODE.get("POINTS")
	if points >= 20:
		upgrade1.disabled = false
	else:
		upgrade1.disabled = true
	
	if points >= 100:
		upgrade2.disabled = false
	else:
		upgrade2.disabled = true
		
	if points >= 1000:
		rebirth.disabled = false
	else:
		rebirth.disabled = true

func _on_upgrade_1_pressed():
	if CONTROL_NODE.POINTS >= 20:
		CONTROL_NODE.POINTS -= 20
		CONTROL_NODE.MULTIPLIER += 1

func _on_upgrade_2_pressed():
	if CONTROL_NODE.POINTS >= 100:
		CONTROL_NODE.POINTS -= 100
		CONTROL_NODE.AUTO_CLICKERS += 1


func _on_rebirth_pressed():
	if CONTROL_NODE.POINTS >= 1000:
		REBIRTH_PROMPT.visible = true
