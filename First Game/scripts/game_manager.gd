extends Node
#
#var score = 0
#
##@onready var score_label = $ScoreLabel
#
#func add_point():
	#score += 1
	#score_label.text = "You collected " + str(score) + " coins."
	
var places
	
func _ready() -> void:
	places = [place1, place2, place3]
	var cauldron : AnimatedSprite2D = $"/root/Game/Lab/UI/CanvasLayer/Cauldron"
	cauldron.play("default")
@onready var place1: AnimatedSprite2D = $"/root/Game/Lab/UI/CanvasLayer/Place1"
@onready var place2: AnimatedSprite2D = $"/root/Game/Lab/UI/CanvasLayer/Place2"
@onready var place3: AnimatedSprite2D = $"/root/Game/Lab/UI/CanvasLayer/Place3"

@onready var platformer = $"/root/Game/Platformer"
@onready var lab = $"/root/Game/Lab"
@onready var lab_canvas = $"/root/Game/Lab/UI/CanvasLayer"

@onready var win: Panel = $"/root/Game/Lab/UI/CanvasLayer/WinScreen"



func clear_items():
	for place in places:
		place.set_frame(0)

func set_frame(num) -> void:
	if place1.frame == 0:
		place1.set_frame(num)
	elif place2.frame == 0:
		place2.set_frame(num)
	elif place3.frame == 0:
		place3.set_frame(num)


func _on_mushroom_1_pressed() -> void:
	set_frame(1)


func _on_mushroom_2_pressed() -> void:
	set_frame(2)

func _on_mushroom_3_pressed() -> void:
	set_frame(3)


func _on_mushroom_4_pressed() -> void:
	set_frame(4)

func _on_mushroom_5_pressed() -> void:
	set_frame(5)


func _on_mushroom_6_property_list_changed() -> void:
	set_frame(6)

func _on_mushroom_7_pressed() -> void:
	set_frame(7)


func _on_mushroom_8_pressed() -> void:
	set_frame(8)


func _on_bottle_1_pressed() -> void:
	set_frame(9)


func _on_bottle_2_pressed() -> void:
	set_frame(10)


func _on_bottle_3_pressed() -> void:
	set_frame(11)


func _on_bottle_4_pressed() -> void:
	set_frame(12)


func _on_clear_pressed() -> void:
	clear_items()


func _on_combine_pressed() -> void:
	var combination = []
	for place in places:
		combination.append(place.frame)
	if combination == [1, 8, 10]:
		print("Combination Found")
		win.visible = true
	else:
		clear_items() 


func _on_lab_entry_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Player":
		platformer.visible = false
		lab.visible = true
		lab_canvas.visible = true
	
