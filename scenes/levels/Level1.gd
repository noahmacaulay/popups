extends Node2D

var rng = RandomNumberGenerator.new()
var timer = 0
var time_limit = 0.8 + rng.randfn(0.0, 0.3)
var resolution = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	#resolution = get_viewport().get_rect().size
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer > time_limit:
		var popup = AcceptDialog.new()
		popup.position = Vector2(rng.randf_range(50, 450), rng.randf_range(50, 450))
		popup.size = Vector2(rng.randf_range(100, 500), rng.randf_range(100, 300))
		popup.transient = false
		popup.visible = true
		add_child(popup)
		timer = 0
		time_limit = 0.8 + rng.randfn(0.0, 0.3)
