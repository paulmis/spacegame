extends MeshInstance

var segments = 50
var height = 0.001
var radius = 1
var thickness = 0.01

func _ready():
	var surface_array= []
	surface_array.resize(Mesh.ARRAY_MAX)

	# PoolVector**Arrays for mesh construction.
	var verts = PoolVector3Array()
	var uvs = PoolVector2Array()
	var normals = PoolVector3Array()
	var indices = PoolIntArray()

	for i in range(segments + 1):
		var u = float(i) / segments
		var x = sin(u * PI * 2.0)
		var z = cos(u * PI * 2.0)
		var vert = Vector3(x * radius, 0, z * radius)
		verts.append(vert)
		normals.append(vert.normalized())
		uvs.append(Vector2(u, v))
		point += 1

	# Assign arrays to mesh array.
	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_TEX_UV] = uvs
	surface_array[Mesh.ARRAY_NORMAL] = normals
	surface_array[Mesh.ARRAY_INDEX] = indices

	# Create mesh surface from mesh array.
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
