extends Node2D

var rng = RandomNumberGenerator.new()
var timer = 0
var total_time = 0
var time_limit_mean = 1.2
var time_limit_short = 0.9
var time_limit_stdev = 0.3
var phaseout = 180.0
var time_limit = time_limit_mean + rng.randfn(0.0, time_limit_stdev)
var resolution = Vector2(0, 0)
var AlertBox = preload("res://scenes/popups/AlertBox.tscn")
var closed_window_count = 0
var total_window_count = 0
var crashed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#resolution = get_viewport().get_rect().size
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if crashed == true:
		return
	timer += delta
	total_time += delta
	if timer > time_limit:
		total_window_count += 1
		var popup = AlertBox.instantiate()
		popup.connect("closed", self.popup_closed)
		add_child(popup)
		timer = 0
		var dynamic_mean
		if total_time > phaseout:
			dynamic_mean = time_limit_short
		else:
			dynamic_mean = total_time/phaseout * time_limit_mean + (phaseout - total_time)/phaseout * time_limit_short
		time_limit = dynamic_mean + rng.randfn(0.0, time_limit_stdev)
		
	var popups = total_window_count - closed_window_count
	if popups > 33:
		for n in self.get_children():
			n.visible = false
		$GameOver.visible = true
		crashed = true
	var percentage = int(popups * 3.333)
	$CPU.text = str(percentage)+"%"
	$Counter.text = str(closed_window_count)
	
	
func popup_closed():
	closed_window_count += 1
