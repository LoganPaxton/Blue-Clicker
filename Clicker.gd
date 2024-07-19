extends Control

@export var LABEL : Label
@export var MULTIPLIER : int = 0
@export var POINTS : float = 0.0
@export var AUTO_CLICKERS : int = 0
@export var PPC : Label
@export var AUTOCLICKERS : Label
@export var REBIRTHING : bool = false

var rebirth_multiplier = 1

@onready var auto_click_timer = $AutoClickTimer

func add_points():
	POINTS += 1 + MULTIPLIER * rebirth_multiplier

func auto_click():
	if AUTO_CLICKERS > 0:
		POINTS += AUTO_CLICKERS

func update_labels():
	LABEL.text = "Points: %s" % POINTS
	PPC.text = "Points Per Click: %s" % (MULTIPLIER + 1)
	AUTOCLICKERS.text = "Auto Clickers %s" % AUTO_CLICKERS

func _ready():
	#$rebirthConf.visible = false
	$rebirthConf.REBIRTH_MULTI = 1.2 # Add logic later on...
	
	auto_click_timer.wait_time = 1.0
	auto_click_timer.timeout.connect(Callable(self, "_on_auto_click_timer_timeout"))
	auto_click_timer.start()

func _process(_delta):
	update_labels()
	
	if REBIRTHING == true:
		POINTS = 0
		rebirth_multiplier = 1.2
		REBIRTHING = false

func _on_clicker_pressed():
	add_points()

func _on_auto_click_timer_timeout():
	auto_click()
