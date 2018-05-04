import bpy
import os
import math
import mathutils
from math import radians
import tempfile

"""
This is a blender script
"""
BASE_DIR = "/home/neha/segmentation/data/blender_data/"
INPUT_DATA_DIR = BASE_DIR + "input_data/"
OUTPUT_DATA_DIR = os.path.join(BASE_DIR, "render_data/")

PROJECT_DIR = "/home/neha/segmentation/blender_scripts_render_plys/"
CAMERA_POSITION_FILE = os.path.join(PROJECT_DIR,"input_files/camera_positions.txt")
CAMERA_FOCAL_FILE = os.path.join(PROJECT_DIR,"input_files/camera_focal_length.txt")
RGB_SUFFIX = "_rgb_"
RGBD_SUFFIX = "_depth_"
VALID_FILE_EXTENSION = ".ply"
REQUIRED_OBJECTS = ['Camera', 'Lamp']
NUMBER_OF_VIEWS = 4 #360
OFFSET_DEGREE_FROM_START = 1
CAMERA_ROTATION_AXIS = 'Z'
VERTEX_GROUP_FILE = os.path.join(PROJECT_DIR,"input_files/vertex_groups.txt")
CAMERA_PROPERTIES_FILE = os.path.join(PROJECT_DIR,"input_files/camera_properties_2.txt")
color_mapping = {}
camera_properties = {}

"""
This method sets camera properties
"""


def set_camera_properties():
    lines = read_file(CAMERA_PROPERTIES_FILE)
    for line in lines:
        property_ = line.split('=')
        property_[1] = property_[1].rstrip()
        camera_properties[property_[0]] = property_[1]
    camera = bpy.data.objects['Camera']
    camera.data.clip_end = 10

    depth_of_field = camera_properties['depth_of_field']
    if depth_of_field:
        camera.data.dof_distance = float(depth_of_field)

    field_of_view_x = camera_properties['field_of_view_x']
    if field_of_view_x:
        camera.data.angle_x = radians(float(field_of_view_x))

    field_of_view_y = camera_properties['field_of_view_y']
    if field_of_view_y:
        camera.data.angle_y = radians(float(field_of_view_y))
        print(camera.data.angle_y)

    field_of_view = camera_properties['field_of_view']
    if field_of_view:
        camera.data.angle = radians(float(field_of_view))

    lens_unit = camera_properties['lens_unit']
    if lens_unit:
        camera.data.lens_unit = lens_unit

    focal_length = camera_properties['focal_length']
    if focal_length:
        camera.data.lens = float(focal_length)

    sensor_height = camera_properties['sensor_height']
    if sensor_height:
        camera.data.sensor_height = float(sensor_height)

    sensor_width = camera_properties['sensor_width']
    if sensor_width:
        camera.data.sensor_width = float(sensor_width)



"""
set camera focal length
"""


def set_camera_focal_length(focal_length):
    camera = bpy.data.objects['Camera']
    camera.data.lens = float(focal_length)


"""
loads vertex_group and color mapping
"""


def load_vertex_group_color_mapping():
    lines = read_file(VERTEX_GROUP_FILE)
    for idx, line in enumerate(lines):
        value = line.split('=')
        rgb = value[1].split(',')
        color_mapping[idx] = (value[0], (float(rgb[0])/255, float(rgb[1])/255, float(rgb[2])/255))


"""
This method returns rgb values based on group_index
"""


def get_vertex_group_color(group_index):
    group_name, color = color_mapping[group_index]
    return color


"""
This method returns rgb values based on vertex_index
"""


def get_vertex_color(vertex_index, mesh):
    vertex = mesh.vertices[vertex_index]
    main_vertex_group_index = -1
    main_vertex_group_weight = -1
    for group in vertex.groups:
        if group.weight > main_vertex_group_weight:
            main_vertex_group_weight = group.weight
            main_vertex_group_index = group.group
    color = get_vertex_group_color(main_vertex_group_index)
    return color


"""
obtain object mesh and create a vertex color map using it.
assign color to every vertex based on its main group.
create a new material using vertex color and set this material
to object mesh material. Finally override the rendered layer material.
"""


def label_body_parts(base_image_name):
    print("labeling body parts....")
    obj_name = base_image_name + "-base"
    obj_mesh = bpy.data.objects[obj_name].data
    color_map_collection = obj_mesh.vertex_colors
    if len(color_map_collection) == 0:
        color_map_collection.new()
    color_map = color_map_collection['Col']
    i = 0
    for poly in obj_mesh.polygons:
        for idx in poly.loop_indices:
            vertex_index = obj_mesh.loops[idx].vertex_index
            rgb = get_vertex_color(vertex_index, obj_mesh)
            color_map.data[i].color = rgb
            i += 1
    # material = bpy.data.materials['vertex_material']
    # if material is None:
    material = bpy.data.materials.new('vertex_material')
    #material.use_shadeless = True
    material.use_vertex_color_paint = True
    obj_mesh.materials.append(material)
    scene = bpy.data.scenes['Scene']
    scene.render.layers['RenderLayer'].material_override = material
    print("labeling complete...")

"""
obtain object mesh and create a vertex color map using it.
assign color to every vertex based on its main group.
create a new material using vertex color and set this material
to object mesh material. Finally override the rendered layer material.
"""


def set_vertex_color(base_image_name):
    print("labeling body parts....")
    obj_name = base_image_name #+ "-base"
    obj_mesh = bpy.data.objects[obj_name].data
    # if material is None:
    material = bpy.data.materials.new('vertex_material')
    material.use_shadeless = True
    material.use_vertex_color_paint = True
    obj_mesh.materials.append(material)
    scene = bpy.data.scenes['Scene']
    scene.render.layers['RenderLayer'].material_override = material
    print("labeling complete...")


"""
Creates an empty obj at the same location as
pivot obj. Sets parent of camera as this empty
obj. This relation makes camera follow the empty obj
"""


def parent_obj_to_camera(pivot_obj, camera):
    origin = pivot_obj.location
    empty_obj = bpy.data.objects.new("Empty", None)
    empty_obj.show_transparent = True
    empty_obj.location = origin
    # setup parenting
    camera.parent = empty_obj

    scene = bpy.context.scene
    scene.objects.link(empty_obj)
    scene.objects.active = empty_obj
    empty_obj.select = True
    return empty_obj


"""
Code to rotate empty object and call label body
parts and then call render camera view
"""


def rotate_empty_and_render(file_name, outfile_base, start_index, offset_degree_start=0, x_offset_empty = 0):
    base_image_name = file_name.split(".")[0]
    rgb_image_name = outfile_base + RGB_SUFFIX
    rgbd_image_name = outfile_base + RGBD_SUFFIX

    camera = bpy.data.objects['Camera']
    pivot_obj = bpy.data.objects[base_image_name]

    # sleeping position
    pivot_obj.rotation_euler = (0, 0, 0)
    pivot_obj.location = (x_offset_empty, 0, 1)

    empty_obj = parent_obj_to_camera(pivot_obj, camera)

    step_size = 360 / NUMBER_OF_VIEWS
    print("------------")
    print(camera.data.angle)
    print(camera.data.lens)
    for itr in range(start_index, start_index + NUMBER_OF_VIEWS):
        mat_rot = mathutils.Matrix.Rotation(radians(offset_degree_start + step_size * (itr + 1)), 4, CAMERA_ROTATION_AXIS)
        empty_obj.matrix_world = mat_rot
        set_vertex_color(base_image_name)
        # set_scene_to_camera_view()
        render_data(data_dir = OUTPUT_DATA_DIR,
                    depth_file_name = rgbd_image_name + str(itr),
                    image_file_name = rgb_image_name + str(itr))
        bpy.context.scene.update()


"""
File reader
"""


def read_file(file_path, ignore_header = True):
    lines = []
    file_obj = open(file_path, "r")
    if ignore_header:
        next(file_obj)
    for line in file_obj:
        if not line.startswith("#"):
            lines.append(line)
    return lines


"""
Reads camera position from a file
"""


def get_camera_positions(file_path):
    # read camera locations and angle from a file
    data = []
    for line in read_file(file_path):
        coordinates = line.split(",")
        pos_data = {}
        pos_data['tx'] = float(coordinates[0].strip())
        pos_data['ty'] = float(coordinates[1].strip())
        pos_data['tz'] = float(coordinates[2].strip())
        pos_data['rx'] = float(coordinates[3].strip())
        pos_data['ry'] = float(coordinates[4].strip())
        pos_data['rz'] = float(coordinates[5].strip())
        pos_data['fov'] = float(coordinates[6].strip())
        data.append(pos_data)
    return data


"""
Reads camera focal lengths from a file
"""


def get_camera_focal_lengths(file_path):
    # read camera locations and angle from a file
    data = []
    for line in read_file(file_path, False):
        focals = line.split(",")
        data = data + [*map(float,focals)]
    return data



"""
Sets camera orientation based on the positions
fetched from the file.
@Deprecated
"""


def set_camera_position(position):
    camera = bpy.data.objects['Camera']
    camera.select = True
    camera.rotation_mode='XYZ'
    constant=math.pi / 180.0
    # camera.data.angle=position['fov'] * constant

    camera.rotation_euler[0]=position['rx'] * constant
    camera.rotation_euler[1]=position['ry'] * constant
    camera.rotation_euler[2]=position['rz'] * constant

    camera.location.x = position['tx']
    camera.location.y = position['ty']
    camera.location.z = position['tz']
    camera.select = False


"""
This sets the current scene to the view of the camera
"""


def set_scene_to_camera_view():
    for area in bpy.context.screen.areas:
        if area.type == 'VIEW_3D':
            area.spaces.active.region_3d.view_perspective = 'CAMERA'
            break


"""
Renders rgb and rgbd images. It creates some kind of
computational map for rendering
"""


def render_data(data_dir, depth_file_name, image_file_name):
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    print("rendering data..")
    scene = bpy.data.scenes['Scene']
    scene.render.image_settings.color_mode = 'RGB'
    scene.render.resolution_percentage = 100
    resolution_x = camera_properties['resolution_x']
    if resolution_x is not None:
        scene.render.resolution_x = int(resolution_x)
    resolution_y = camera_properties['resolution_y']
    if resolution_y is not None:
        scene.render.resolution_y = int(resolution_y)

    bpy.context.scene.use_nodes = True
    tree = bpy.context.scene.node_tree
    links = tree.links
    for n in tree.nodes:
        tree.nodes.remove(n)
    rl = tree.nodes.new('CompositorNodeRLayers')
    fileOutput = tree.nodes.new(type = "CompositorNodeOutputFile")
    fileOutput.base_path = data_dir
    fileOutput.file_slots[0].path = depth_file_name + '_'
    fileOutput.format.file_format = "OPEN_EXR"
    links.new(rl.outputs[2], fileOutput.inputs[0])
    # For rendering rgb data
    image_path = os.path.join(data_dir, image_file_name)
    scene.render.filepath = image_path
    scene.render.image_settings.use_zbuffer = True
    bpy.ops.render.render(write_still = True)

    print("data rendering done successfully!!")


"""
For rendering rgb images
# @depricated
"""


def render_image(file_name):
    image_path = os.path.join(OUTPUT_DATA_DIR, file_name)
    bpy.data.scenes['Scene'].render.filepath = image_path
    bpy.ops.render.render(write_still = True)


"""
For validating file extension
"""


def validate_file(file_name, extensions):
    if file_name.endswith(extensions):
        return True
    return False


"""
imports makehuman files
"""


def import_file(file_path):
    print("importing file : " + file_path)
    # bpy.ops.import_scene.makehuman_mhx2(filepath=file_path)
    bpy.ops.import_mesh.ply(filepath = file_path)
    print("file imported!")


"""
@Deprecated
"""


def process_and_render_scene(file_name):
    base_image_name = file_name.split(".")[0]
    rgb_image_name = base_image_name + RGB_SUFFIX
    rgbd_image_name = base_image_name + RGBD_SUFFIX
    for itr, position in enumerate(get_camera_positions(CAMERA_POSITION_FILE)):
        # set_camera_position(position)
        # set_scene_to_camera_view()
        # render_image(rgb_image_name+str(itr))
        render_data(data_dir = OUTPUT_DATA_DIR,
                    depth_file_name = rgbd_image_name + str(itr),
                    image_file_name = rgb_image_name + str(itr))


"""
It clears the scene, removes unwanted objects
"""


def clear_scene():
    # This will take you the home screen and you will be in the object mode
    print("clearing current scene...")
    # bpy.ops.wm.read_homefile()
    if bpy.context.mode is not 'OBJECT':
        bpy.ops.object.mode_set(mode = 'OBJECT')

    for obj in bpy.data.objects:
        if obj.name not in REQUIRED_OBJECTS:
            bpy.data.objects.remove(obj, do_unlink = True)
    for scene in bpy.data.scenes:
        for obj in scene.objects:
            if obj.name not in REQUIRED_OBJECTS:
                scene.objects.unlink(obj)
    for key in bpy.data.materials.keys():
        if key == 'vertex_material':
            material = bpy.data.materials.get('vertex_material')
            bpy.data.materials.remove(material, do_unlink = True)
    print("scene cleared!")


"""
main method of the script
"""
if __name__ == "__main__":
    import time
    from random import  randint
    scene = bpy.data.scenes['Scene']
    scene.unit_settings.system = 'METRIC'

    # Get filenames and sort them
    fileNames = os.listdir(INPUT_DATA_DIR)
    fileNames = list(filter(lambda x: x.endswith(VALID_FILE_EXTENSION), fileNames))
    fileNames.sort()

    lamp = bpy.data.objects['Lamp']
    lamp.data.type = 'HEMI'
    set_camera_properties()
    #load_vertex_group_color_mapping()
    starttime = time.time()
    recordName = os.path.join(INPUT_DATA_DIR, 'last_saved')
    itr_pos_start, itr_focals_start, itr_file_start = [0,0,0]
    if os.path.exists(recordName):
        with open(recordName, mode='r') as fin:
            fline = fin.readline()
            itr_pos_start, itr_focals_start, itr_file_start = list(map(int,fline.split(',')))
    else:
        with open(recordName,mode='w') as fout:
            fout.write(str(itr_pos_start)+','+str(itr_focals_start)+ ','+str(itr_file_start))
    cam_pos = get_camera_positions(CAMERA_POSITION_FILE)
    offset_degree_start = 0
    num_process_files = 600
    itr_file_stop = (itr_file_start+num_process_files) if (itr_file_start+num_process_file)<len(fileNames) else len(fileNames)
    print(itr_file_stop)
    for itr_file in range(itr_file_start, itr_file_stop):
        fileName = fileNames[itr_file]
        for itr_pos in range(itr_pos_start, len(cam_pos)):
            position = cam_pos[itr_pos]
            set_camera_position(position)
            focal_lengths = get_camera_focal_lengths(CAMERA_FOCAL_FILE)
            for itr_focals in range(itr_focals_start, len(focal_lengths)):
                focal = focal_lengths[itr_focals]
                set_camera_focal_length(focal)
                for itr_empty_pos in range(2):
                    if validate_file(fileName, VALID_FILE_EXTENSION):
                        clear_scene()
                        file_path = os.path.join(INPUT_DATA_DIR, fileName)
                        import_file(file_path)
                        # process_and_render_scene(fileName)
                        index = (itr_pos * len(focal_lengths) + itr_focals)*2 + itr_empty_pos
                        print('filename: ',fileName,' , offset_degree_start: ',offset_degree_start, ' , index:', index)

                        outFileBase = 'human_'+str(itr_file)
                        x_offset_empty = itr_empty_pos*randint(-1,1)*0.5
                        rotate_empty_and_render(fileName, outFileBase, index*NUMBER_OF_VIEWS, offset_degree_start, x_offset_empty)

                        # Save positions to file
                        with tempfile.NamedTemporaryFile(mode='w', dir=os.path.dirname(recordName), delete=False) as fout:
                            fout.write(str(itr_pos)+','+str(itr_focals)+','+str(itr_file))
                        os.replace(fout.name, recordName)
                    else:
                        #print(os.path.join(INPUT_DATA_DIR, fileName) + " is not a PLY file!")
                        pass
            itr_focals_start = 0
        itr_pos_start = 0
        offset_degree_start = offset_degree_start+OFFSET_DEGREE_FROM_START
    endtime = time.time()
    print('Time taken: ',endtime - starttime)
