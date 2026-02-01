extends Label

var deaths = 0

func _ready() -> void:
	self.text = "Deaths: "+str(0)

func died() -> void:
	deaths =+ 1
	self.text = "Deaths: "+str(deaths)
