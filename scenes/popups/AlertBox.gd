extends AcceptDialog
var rng = RandomNumberGenerator.new()
signal closed

var title_list = ["Hello",
	"BUY NOW",
	"Doctors HATE Him",
	"Unusual Incident",
	"2 FOR THE PRICE OF 1",
	"You Just Won!!!",
	"A TALKING PIG?!?!",
	"Trouble with Popups?"	
]

var dialog_list = ["Lizards rule the Earth? Learn about the true power behind world events and...",
"One boy challenged the orthodoxy of centuries. Now he's written a book about his life and it's...",
"Get cheap tickets to T-Swift's new concert. Offer ends this week!! Claim your cheap tickets now at...",
"THIS IS THE DEAL OF A LIFETIME. OUR INSTA-MASHER IS TOP-CLASS KITCHEN ACCESSORY AS VOTED BY KITCHEWORLD IN...",
"The dread god Cthulhu ANNIHILATES woke students in live debate!! WAtch now at youtubewatch.viz.thai.co/#342...",
"Will Arbuckle was a regular farmer. One day he came home for the harvest and everything changed when...",
"YOU ARE THE ONE MILLIONTH VISITOR. CLICK HERE TO RECEIEVE YOUR EXCLUSIVE PRIZE",
"Are you inundated by popups? Our popup-blocker will take care of that for only $9.99. Buy now at..."]

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(rng.randf_range(50, 450), rng.randf_range(50, 450))
	self.size = Vector2(rng.randf_range(100, 500), rng.randf_range(100, 300))
	self.transient = false
	self.visible = true
	self.title = title_list[rng.randi()%title_list.size()]
	self.dialog_text = dialog_list[rng.randi()%dialog_list.size()]


func _on_canceled_confirmed():
	self.hide()
	self.queue_free()
	emit_signal("closed")




