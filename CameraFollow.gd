extends Camera3D

@export var target_node: Node3D
@export var offset: Vector3 = Vector3(0, 15, 4)

func _ready():
	if not target_node:
		target_node = get_node("../Player")

func _process(_delta):
	if target_node:
		position = target_node.position + offset
		look_at(target_node.position)
