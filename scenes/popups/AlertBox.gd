extends AcceptDialog
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(rng.randf_range(50, 450), rng.randf_range(50, 450))
	self.size = Vector2(rng.randf_range(100, 500), rng.randf_range(100, 300))
	self.transient = false
	self.visible = true


func _on_canceled_confirmed():
	self.hide()
	self.queue_free()

