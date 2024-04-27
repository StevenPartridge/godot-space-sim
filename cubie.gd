extends Node3D

# Size of the Cubie, defaulting to 1000 units.
@export var size: float = 1000.0

# Possible content types for demonstration purposes
enum ContentType {EMPTY, ASTEROIDS, SALVAGE}

# Current content of the Cubie
@export var content: ContentType = ContentType.EMPTY

func _ready():
	# Initialize content based on procedural rules here
	randomize_content()

func randomize_content():
	# Placeholder logic for random content generation
	content = randi() % 3
	print("Cubie at position ", global_transform.origin, " has content type: ", content)
