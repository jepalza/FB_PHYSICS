/'
 * Copyright 2009-2013 Maarten Baert
 * maarten-baert@hotmail.com
 * http://www.maartenbaert.be/
 * 
 * This file is part of ExtremePhysics.
 * 
 * ExtremePhysics is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * ExtremePhysics is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with ExtremePhysics. If not, see <http://www.gnu.org/licenses/>.
 * 
 * File: ExtremePhysics.h
 * Include this file in your project to use the engine.
 '/

' version adaptada a FREEBASIC por Joseba Epalza <jepalza - gmail.com> , 2024

#Inclib "ExtremePhysics"


' --------------------------------
' exclusivas GAMEMAKER 6,7 y 8 (y 8.1) (GM) para "su" motor grafico y mostrar el "buffer" donde se dibuja
Declare Function ep_gm_functions_init Cdecl Alias "ep_gm_functions_init"( ) As Double
Declare Function ep_gm_functions_init_address Cdecl Alias "ep_gm_functions_init_address"(ByVal address As Double) As Double
' estas muestran el "outline" de los elementos. Solo funcionan en GM
Declare Function ep_debugdraw_set_transformation Cdecl Alias "ep_debugdraw_set_transformation"(ByVal translation_x As Double, Byval translation_y As Double, Byval rotation As Double, ByVal scale As Double) As Double
Declare Function ep_debugdraw_bodies Cdecl Alias "ep_debugdraw_bodies"(ByVal world_id As Double, Byval color_static As Double, ByVal color_dynamic As Double) As Double
Declare Function ep_debugdraw_links Cdecl Alias "ep_debugdraw_links"(ByVal world_id As Double, Byval color_shapelink As Double, Byval color_contactlink As Double, ByVal color_jointlink As Double) As Double
Declare Function ep_debugdraw_views Cdecl Alias "ep_debugdraw_views"(ByVal world_id As Double, ByVal color_view As Double) As Double
Declare Function ep_debugdraw_velocity Cdecl Alias "ep_debugdraw_velocity"(ByVal world_id As Double, Byval color_velocity As Double, Byval scale As Double, ByVal rotscale As Double) As Double
Declare Function ep_debugdraw_forces Cdecl Alias "ep_debugdraw_forces"(ByVal world_id As Double, Byval color_force As Double, Byval scale As Double, ByVal rotscale As Double) As Double
Declare Function ep_debugdraw_constraints Cdecl Alias "ep_debugdraw_constraints"(ByVal world_id As Double, Byval color_contactpoint As Double, ByVal color_joint As Double) As Double
' -------------------------------


Declare Function ep_version Cdecl Alias "ep_version"( ) As Zstring Ptr
Declare Function ep_set_log_file Cdecl Alias "ep_set_log_file"(ByVal enable As Double, Byval filename As Zstring Ptr, ByVal level As Double) As Double
Declare Function ep_set_show_errors Cdecl Alias "ep_set_show_errors"(ByVal enable As Double) As Double
Declare Function ep_message Cdecl Alias "ep_message"(ByVal level As Double, strings As Zstring Ptr) As Double
Declare Function ep_print_object_tree Cdecl Alias "ep_print_object_tree"( ) As Double

Declare Function ep_world_create Cdecl Alias "ep_world_create"( ) As Double
Declare Function ep_world_destroy Cdecl Alias "ep_world_destroy"(ByVal world_id As Double) As Double
Declare Function ep_world_exists Cdecl Alias "ep_world_exists"(ByVal world_id As Double) As Double
Declare Function ep_world_clear Cdecl Alias "ep_world_clear"(ByVal world_id As Double) As Double
Declare Function ep_world_set_settings Cdecl Alias "ep_world_set_settings"(ByVal world_id As Double, Byval timestep As Double, Byval velocity_iterations As Double, Byval position_iterations As Double, Byval contact_threshold As Double, Byval velocity_threshold As Double, Byval baumgarte_factor As Double, Byval mass_bias As Double, ByVal position_factor As Double) As Double
Declare Function ep_world_set_primary_axis Cdecl Alias "ep_world_set_primary_axis"(ByVal world_id As Double, ByVal horizontal As Double) As Double
Declare Function ep_world_set_sleeping Cdecl Alias "ep_world_set_sleeping"(ByVal world_id As Double, Byval enable_sleeping As Double, Byval time_stable As Double, Byval time_outofview As Double, Byval stable_maxvel As Double, ByVal stable_maxrotvel As Double) As Double
Declare Function ep_world_update_contacts Cdecl Alias "ep_world_update_contacts"(ByVal world_id As Double) As Double
Declare Function ep_world_simulate_step Cdecl Alias "ep_world_simulate_step"(ByVal world_id As Double) As Double
Declare Function ep_world_collision_test_box Cdecl Alias "ep_world_collision_test_box"(ByVal world_id As Double, Byval w As Double, Byval h As Double, Byval x As Double, Byval y As Double, Byval rot As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_world_collision_test_line Cdecl Alias "ep_world_collision_test_line"(ByVal world_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, Byval y2 As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_world_collision_test_circle Cdecl Alias "ep_world_collision_test_circle"(ByVal world_id As Double, Byval r As Double, Byval x As Double, Byval y As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_world_collision_test_polygon Cdecl Alias "ep_world_collision_test_polygon"(ByVal world_id As Double, Byval polygon_id As Double, Byval x As Double, Byval y As Double, Byval rot As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_world_ray_cast Cdecl Alias "ep_world_ray_cast"(ByVal world_id As Double, Byval x As Double, Byval y As Double, Byval vx As Double, Byval vy As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_world_get_collision_body Cdecl Alias "ep_world_get_collision_body"(ByVal world_id As Double, ByVal index As Double) As Double
Declare Function ep_world_get_collision_shape Cdecl Alias "ep_world_get_collision_shape"(ByVal world_id As Double, ByVal index As Double) As Double
Declare Function ep_world_multipoly_begin Cdecl Alias "ep_world_multipoly_begin"(ByVal world_id As Double, ByVal vertexcount As Double) As Double
Declare Function ep_world_multipoly_end Cdecl Alias "ep_world_multipoly_end"(ByVal world_id As Double, ByVal showerrors As Double) As Double
Declare Function ep_world_multipoly_set_vertex Cdecl Alias "ep_world_multipoly_set_vertex"(ByVal world_id As Double, Byval index As Double, Byval x As Double, ByVal y As Double) As Double
Declare Function ep_world_multipoly_get_first Cdecl Alias "ep_world_multipoly_get_first"(ByVal world_id As Double) As Double
Declare Function ep_world_multipoly_get_last Cdecl Alias "ep_world_multipoly_get_last"(ByVal world_id As Double) As Double
Declare Function ep_world_serialize Cdecl Alias "ep_world_serialize"(ByVal world_id As Double) As string
Declare Function ep_world_unserialize Cdecl Alias "ep_world_unserialize"(ByVal world_id As Double, ByVal Data As string) As Double
Declare Function ep_world_previous Cdecl Alias "ep_world_previous"(ByVal world_id As Double) As Double
Declare Function ep_world_next Cdecl Alias "ep_world_next"(ByVal world_id As Double) As Double
Declare Function ep_world_set_uservar Cdecl Alias "ep_world_set_uservar"(ByVal world_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_world_get_uservar Cdecl Alias "ep_world_get_uservar"(ByVal world_id As Double, Byval body_id As Double, ByVal index As Double) As Double
Declare Function ep_world_first_polygon Cdecl Alias "ep_world_first_polygon"(ByVal world_id As Double) As Double
Declare Function ep_world_last_polygon Cdecl Alias "ep_world_last_polygon"(ByVal world_id As Double) As Double
Declare Function ep_world_polygon_count Cdecl Alias "ep_world_polygon_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_body Cdecl Alias "ep_world_first_body"(ByVal world_id As Double) As Double
Declare Function ep_world_last_body Cdecl Alias "ep_world_last_body"(ByVal world_id As Double) As Double
Declare Function ep_world_body_count Cdecl Alias "ep_world_body_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_contact Cdecl Alias "ep_world_first_contact"(ByVal world_id As Double) As Double
Declare Function ep_world_last_contact Cdecl Alias "ep_world_last_contact"(ByVal world_id As Double) As Double
Declare Function ep_world_contact_count Cdecl Alias "ep_world_contact_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_hingejoint Cdecl Alias "ep_world_first_hingejoint"(ByVal world_id As Double) As Double
Declare Function ep_world_last_hingejoint Cdecl Alias "ep_world_last_hingejoint"(ByVal world_id As Double) As Double
Declare Function ep_world_hingejoint_count Cdecl Alias "ep_world_hingejoint_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_distancejoint Cdecl Alias "ep_world_first_distancejoint"(ByVal world_id As Double) As Double
Declare Function ep_world_last_distancejoint Cdecl Alias "ep_world_last_distancejoint"(ByVal world_id As Double) As Double
Declare Function ep_world_distancejoint_count Cdecl Alias "ep_world_distancejoint_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_railjoint Cdecl Alias "ep_world_first_railjoint"(ByVal world_id As Double) As Double
Declare Function ep_world_last_railjoint Cdecl Alias "ep_world_last_railjoint"(ByVal world_id As Double) As Double
Declare Function ep_world_railjoint_count Cdecl Alias "ep_world_railjoint_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_sliderjoint Cdecl Alias "ep_world_first_sliderjoint"(ByVal world_id As Double) As Double
Declare Function ep_world_last_sliderjoint Cdecl Alias "ep_world_last_sliderjoint"(ByVal world_id As Double) As Double
Declare Function ep_world_sliderjoint_count Cdecl Alias "ep_world_sliderjoint_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_view Cdecl Alias "ep_world_first_view"(ByVal world_id As Double) As Double
Declare Function ep_world_last_view Cdecl Alias "ep_world_last_view"(ByVal world_id As Double) As Double
Declare Function ep_world_view_count Cdecl Alias "ep_world_view_count"(ByVal world_id As Double) As Double
Declare Function ep_world_first_water Cdecl Alias "ep_world_first_water"(ByVal world_id As Double) As Double
Declare Function ep_world_last_water Cdecl Alias "ep_world_last_water"(ByVal world_id As Double) As Double
Declare Function ep_world_water_count Cdecl Alias "ep_world_water_count"(ByVal world_id As Double) As Double
Declare Function ep_world_shape_count Cdecl Alias "ep_world_shape_count"(ByVal world_id As Double) As Double
Declare Function ep_world_force_count Cdecl Alias "ep_world_force_count"(ByVal world_id As Double) As Double

Declare Function ep_collision_test_box_box Cdecl Alias "ep_collision_test_box_box"(ByVal shape1_w As Double, Byval shape1_h As Double, Byval shape1_x As Double, Byval shape1_y As Double, Byval shape1_rot As Double, Byval shape2_w As Double, Byval shape2_h As Double, Byval shape2_x As Double, Byval shape2_y As Double, Byval shape2_rot As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_box_line Cdecl Alias "ep_collision_test_box_line"(ByVal shape1_w As Double, Byval shape1_h As Double, Byval shape1_x As Double, Byval shape1_y As Double, Byval shape1_rot As Double, Byval shape2_x1 As Double, Byval shape2_y1 As Double, Byval shape2_x2 As Double, Byval shape2_y2 As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_box_circle Cdecl Alias "ep_collision_test_box_circle"(ByVal shape1_w As Double, Byval shape1_h As Double, Byval shape1_x As Double, Byval shape1_y As Double, Byval shape1_rot As Double, Byval shape2_r As Double, Byval shape2_x As Double, Byval shape2_y As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_box_polygon Cdecl Alias "ep_collision_test_box_polygon"(ByVal shape1_w As Double, Byval shape1_h As Double, Byval shape1_x As Double, Byval shape1_y As Double, Byval shape1_rot As Double, Byval shape2_world_id As Double, Byval shape2_polygon_id As Double, Byval shape2_x As Double, Byval shape2_y As Double, Byval shape2_rot As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_line_line Cdecl Alias "ep_collision_test_line_line"(ByVal shape1_x1 As Double, Byval shape1_y1 As Double, Byval shape1_x2 As Double, Byval shape1_y2 As Double, Byval shape2_x1 As Double, Byval shape2_y1 As Double, Byval shape2_x2 As Double, Byval shape2_y2 As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_line_circle Cdecl Alias "ep_collision_test_line_circle"(ByVal shape1_x1 As Double, Byval shape1_y1 As Double, Byval shape1_x2 As Double, Byval shape1_y2 As Double, Byval shape2_r As Double, Byval shape2_x As Double, Byval shape2_y As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_line_polygon Cdecl Alias "ep_collision_test_line_polygon"(ByVal shape1_x1 As Double, Byval shape1_y1 As Double, Byval shape1_x2 As Double, Byval shape1_y2 As Double, Byval shape2_world_id As Double, Byval shape2_polygon_id As Double, Byval shape2_x As Double, Byval shape2_y As Double, Byval shape2_rot As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_circle_circle Cdecl Alias "ep_collision_test_circle_circle"(ByVal shape1_r As Double, Byval shape1_x As Double, Byval shape1_y As Double, Byval shape2_r As Double, Byval shape2_x As Double, Byval shape2_y As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_circle_polygon Cdecl Alias "ep_collision_test_circle_polygon"(ByVal shape1_r As Double, Byval shape1_x As Double, Byval shape1_y As Double, Byval shape2_world_id As Double, Byval shape2_polygon_id As Double, Byval shape2_x As Double, Byval shape2_y As Double, Byval shape2_rot As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_collision_test_polygon_polygon Cdecl Alias "ep_collision_test_polygon_polygon"(ByVal shape1_world_id As Double, Byval shape1_polygon_id As Double, Byval shape1_x As Double, Byval shape1_y As Double, Byval shape1_rot As Double, Byval shape2_world_id As Double, Byval shape2_polygon_id As Double, Byval shape2_x As Double, Byval shape2_y As Double, Byval shape2_rot As Double, ByVal contact_threshold As Double) As Double

Declare Function ep_ray_cast_box Cdecl Alias "ep_ray_cast_box"(ByVal ray_x As Double, Byval ray_y As Double, Byval ray_vx As Double, Byval ray_vy As Double, Byval shape_w As Double, Byval shape_h As Double, Byval shape_x As Double, Byval shape_y As Double, ByVal shape_rot As Double) As Double
Declare Function ep_ray_cast_line Cdecl Alias "ep_ray_cast_line"(ByVal ray_x As Double, Byval ray_y As Double, Byval ray_vx As Double, Byval ray_vy As Double, Byval shape_x1 As Double, Byval shape_y1 As Double, Byval shape_x2 As Double, ByVal shape_y2 As Double) As Double
Declare Function ep_ray_cast_circle Cdecl Alias "ep_ray_cast_circle"(ByVal ray_x As Double, Byval ray_y As Double, Byval ray_vx As Double, Byval ray_vy As Double, Byval shape_r As Double, Byval shape_x As Double, ByVal shape_y As Double) As Double
Declare Function ep_ray_cast_polygon Cdecl Alias "ep_ray_cast_polygon"(ByVal ray_x As Double, Byval ray_y As Double, Byval ray_vx As Double, Byval ray_vy As Double, Byval shape_world_id As Double, Byval shape_polygon_id As Double, Byval shape_x As Double, Byval shape_y As Double, ByVal shape_rot As Double) As Double

Declare Function ep_first_world Cdecl Alias "ep_first_world"( ) As Double
Declare Function ep_last_world Cdecl Alias "ep_last_world"( ) As Double

Declare Function ep_polygon_create Cdecl Alias "ep_polygon_create"(ByVal world_id As Double, ByVal vertex_count As Double) As Double
Declare Function ep_polygon_destroy Cdecl Alias "ep_polygon_destroy"(ByVal world_id As Double, ByVal polygon_id As Double) As Double
Declare Function ep_polygon_exists Cdecl Alias "ep_polygon_exists"(ByVal world_id As Double, ByVal polygon_id As Double) As Double
Declare Function ep_polygon_set_vertex Cdecl Alias "ep_polygon_set_vertex"(ByVal world_id As Double, Byval polygon_id As Double, Byval index As Double, Byval x As Double, ByVal y As Double) As Double
Declare Function ep_polygon_initialize Cdecl Alias "ep_polygon_initialize"(ByVal world_id As Double, ByVal polygon_id As Double) As Double
Declare Function ep_polygon_get_vertex_count Cdecl Alias "ep_polygon_get_vertex_count"(ByVal world_id As Double, ByVal polygon_id As Double) As Double
Declare Function ep_polygon_get_vertex_x Cdecl Alias "ep_polygon_get_vertex_x"(ByVal world_id As Double, Byval polygon_id As Double, ByVal index As Double) As Double
Declare Function ep_polygon_get_vertex_y Cdecl Alias "ep_polygon_get_vertex_y"(ByVal world_id As Double, Byval polygon_id As Double, ByVal index As Double) As Double
Declare Function ep_polygon_get_vertex_normal_x Cdecl Alias "ep_polygon_get_vertex_normal_x"(ByVal world_id As Double, Byval polygon_id As Double, ByVal index As Double) As Double
Declare Function ep_polygon_get_vertex_normal_y Cdecl Alias "ep_polygon_get_vertex_normal_y"(ByVal world_id As Double, Byval polygon_id As Double, ByVal index As Double) As Double
Declare Function ep_polygon_get_edge_length Cdecl Alias "ep_polygon_get_edge_length"(ByVal world_id As Double, Byval polygon_id As Double, ByVal index As Double) As Double
Declare Function ep_polygon_previous Cdecl Alias "ep_polygon_previous"(ByVal world_id As Double, ByVal polygon_id As Double) As Double
Declare Function ep_polygon_next Cdecl Alias "ep_polygon_next"(ByVal world_id As Double, ByVal polygon_id As Double) As Double
Declare Function ep_polygon_set_uservar Cdecl Alias "ep_polygon_set_uservar"(ByVal world_id As Double, Byval polygon_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_polygon_get_uservar Cdecl Alias "ep_polygon_get_uservar"(ByVal world_id As Double, Byval polygon_id As Double, ByVal index As Double) As Double

Declare Function ep_body_create_static Cdecl Alias "ep_body_create_static"(ByVal world_id As Double) As Double
Declare Function ep_body_create_dynamic Cdecl Alias "ep_body_create_dynamic"(ByVal world_id As Double, ByVal norotation As Double) As Double
Declare Function ep_body_destroy Cdecl Alias "ep_body_destroy"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_exists Cdecl Alias "ep_body_exists"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_calculate_mass Cdecl Alias "ep_body_calculate_mass"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_first_hingejoint Cdecl Alias "ep_body_get_first_hingejoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_last_hingejoint Cdecl Alias "ep_body_get_last_hingejoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_previous_hingejoint Cdecl Alias "ep_body_get_previous_hingejoint"(ByVal world_id As Double, Byval body_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_body_get_next_hingejoint Cdecl Alias "ep_body_get_next_hingejoint"(ByVal world_id As Double, Byval body_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_body_get_first_distancejoint Cdecl Alias "ep_body_get_first_distancejoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_last_distancejoint Cdecl Alias "ep_body_get_last_distancejoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_previous_distancejoint Cdecl Alias "ep_body_get_previous_distancejoint"(ByVal world_id As Double, Byval body_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_body_get_next_distancejoint Cdecl Alias "ep_body_get_next_distancejoint"(ByVal world_id As Double, Byval body_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_body_get_first_railjoint Cdecl Alias "ep_body_get_first_railjoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_last_railjoint Cdecl Alias "ep_body_get_last_railjoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_previous_railjoint Cdecl Alias "ep_body_get_previous_railjoint"(ByVal world_id As Double, Byval body_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_body_get_next_railjoint Cdecl Alias "ep_body_get_next_railjoint"(ByVal world_id As Double, Byval body_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_body_get_first_sliderjoint Cdecl Alias "ep_body_get_first_sliderjoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_last_sliderjoint Cdecl Alias "ep_body_get_last_sliderjoint"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_previous_sliderjoint Cdecl Alias "ep_body_get_previous_sliderjoint"(ByVal world_id As Double, Byval body_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_body_get_next_sliderjoint Cdecl Alias "ep_body_get_next_sliderjoint"(ByVal world_id As Double, Byval body_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_body_get_mass Cdecl Alias "ep_body_get_mass"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_inertia Cdecl Alias "ep_body_get_inertia"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_center_of_mass_x Cdecl Alias "ep_body_get_center_of_mass_x"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_center_of_mass_y Cdecl Alias "ep_body_get_center_of_mass_y"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_x Cdecl Alias "ep_body_get_x"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_y Cdecl Alias "ep_body_get_y"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_x_center Cdecl Alias "ep_body_get_x_center"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_y_center Cdecl Alias "ep_body_get_y_center"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_rot Cdecl Alias "ep_body_get_rot"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_xvel_center Cdecl Alias "ep_body_get_xvel_center"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_yvel_center Cdecl Alias "ep_body_get_yvel_center"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_get_xvel_local_point Cdecl Alias "ep_body_get_xvel_local_point"(ByVal world_id As Double, Byval body_id As Double, Byval localx As Double, ByVal localy As Double) As Double
Declare Function ep_body_get_yvel_local_point Cdecl Alias "ep_body_get_yvel_local_point"(ByVal world_id As Double, Byval body_id As Double, Byval localx As Double, ByVal localy As Double) As Double
Declare Function ep_body_get_rotvel Cdecl Alias "ep_body_get_rotvel"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_set_mass Cdecl Alias "ep_body_set_mass"(ByVal world_id As Double, Byval body_id As Double, ByVal mass As Double) As Double
Declare Function ep_body_set_inertia Cdecl Alias "ep_body_set_inertia"(ByVal world_id As Double, Byval body_id As Double, ByVal inertia As Double) As Double
Declare Function ep_body_set_center Cdecl Alias "ep_body_set_center"(ByVal world_id As Double, Byval body_id As Double, Byval localx As Double, Byval localy As Double, ByVal updateinertia As Double) As Double
Declare Function ep_body_set_position Cdecl Alias "ep_body_set_position"(ByVal world_id As Double, Byval body_id As Double, Byval x As Double, Byval y As Double, ByVal rot As Double) As Double
Declare Function ep_body_set_position_center Cdecl Alias "ep_body_set_position_center"(ByVal world_id As Double, Byval body_id As Double, Byval x As Double, Byval y As Double, ByVal rot As Double) As Double
Declare Function ep_body_set_position_local_point Cdecl Alias "ep_body_set_position_local_point"(ByVal world_id As Double, Byval body_id As Double, Byval x As Double, Byval y As Double, Byval rot As Double, Byval localx As Double, ByVal localy As Double) As Double
Declare Function ep_body_set_velocity_center Cdecl Alias "ep_body_set_velocity_center"(ByVal world_id As Double, Byval body_id As Double, Byval xvel As Double, Byval yvel As Double, ByVal rotvel As Double) As Double
Declare Function ep_body_set_velocity_local_point Cdecl Alias "ep_body_set_velocity_local_point"(ByVal world_id As Double, Byval body_id As Double, Byval xvel As Double, Byval yvel As Double, Byval rotvel As Double, Byval localx As Double, ByVal localy As Double) As Double
Declare Function ep_body_set_max_velocity Cdecl Alias "ep_body_set_max_velocity"(ByVal world_id As Double, Byval body_id As Double, Byval maxvel As Double, ByVal maxrotvel As Double) As Double
Declare Function ep_body_set_gravity Cdecl Alias "ep_body_set_gravity"(ByVal world_id As Double, Byval body_id As Double, Byval gravity_x As Double, ByVal gravity_y As Double) As Double
Declare Function ep_body_set_damping Cdecl Alias "ep_body_set_damping"(ByVal world_id As Double, Byval body_id As Double, Byval damping As Double, ByVal rotdamping As Double) As Double
Declare Function ep_body_set_sleeping Cdecl Alias "ep_body_set_sleeping"(ByVal world_id As Double, Byval body_id As Double, Byval sleepstable As Double, ByVal sleepoutofview As Double) As Double
Declare Function ep_body_collision_test_box Cdecl Alias "ep_body_collision_test_box"(ByVal world_id As Double, Byval body_id As Double, Byval w As Double, Byval h As Double, Byval x As Double, Byval y As Double, Byval rot As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_body_collision_test_line Cdecl Alias "ep_body_collision_test_line"(ByVal world_id As Double, Byval body_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, Byval y2 As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_body_collision_test_circle Cdecl Alias "ep_body_collision_test_circle"(ByVal world_id As Double, Byval body_id As Double, Byval r As Double, Byval x As Double, Byval y As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_body_collision_test_polygon Cdecl Alias "ep_body_collision_test_polygon"(ByVal world_id As Double, Byval body_id As Double, Byval polygon_id As Double, Byval x As Double, Byval y As Double, Byval rot As Double, Byval contact_threshold As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_body_store_impulses Cdecl Alias "ep_body_store_impulses"(ByVal world_id As Double, Byval body_id As Double, Byval storecontactimpulses As Double, ByVal storejointimpulses As Double) As Double
Declare Function ep_body_ray_cast Cdecl Alias "ep_body_ray_cast"(ByVal world_id As Double, Byval body_id As Double, Byval x As Double, Byval y As Double, Byval vx As Double, Byval vy As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_body_apply_impulse Cdecl Alias "ep_body_apply_impulse"(ByVal world_id As Double, Byval body_id As Double, Byval localx As Double, Byval localy As Double, Byval xforce As Double, Byval yforce As Double, Byval torque As Double, Byval local As Double, Byval ignoremass As Double, ByVal awake As Double) As Double
Declare Function ep_body_apply_impulse_relative Cdecl Alias "ep_body_apply_impulse_relative"(ByVal world_id As Double, Byval body_id As Double, Byval relativex As Double, Byval relativey As Double, Byval xforce As Double, Byval yforce As Double, Byval torque As Double, Byval ignoremass As Double, ByVal awake As Double) As Double
Declare Function ep_body_is_static Cdecl Alias "ep_body_is_static"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_is_norotation Cdecl Alias "ep_body_is_norotation"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_is_sleeping Cdecl Alias "ep_body_is_sleeping"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_stable_timer Cdecl Alias "ep_body_stable_timer"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_out_of_view_timer Cdecl Alias "ep_body_out_of_view_timer"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_coord_local_to_world_x Cdecl Alias "ep_body_coord_local_to_world_x"(ByVal world_id As Double, Byval body_id As Double, Byval localx As Double, ByVal localy As Double) As Double
Declare Function ep_body_coord_local_to_world_y Cdecl Alias "ep_body_coord_local_to_world_y"(ByVal world_id As Double, Byval body_id As Double, Byval localx As Double, ByVal localy As Double) As Double
Declare Function ep_body_coord_world_to_local_x Cdecl Alias "ep_body_coord_world_to_local_x"(ByVal world_id As Double, Byval body_id As Double, Byval worldx As Double, ByVal worldy As Double) As Double
Declare Function ep_Body_coord_world_to_local_y Cdecl Alias "ep_body_coord_world_to_local_y"(ByVal world_id As Double, Byval body_id As Double, Byval worldx As Double, ByVal worldy As Double) As Double
Declare Function ep_body_vect_local_to_world_x Cdecl Alias "ep_body_vect_local_to_world_x"(ByVal world_id As Double, Byval body_id As Double, Byval vx As Double, ByVal vy As Double) As Double
Declare Function ep_body_vect_local_to_world_y Cdecl Alias "ep_body_vect_local_to_world_y"(ByVal world_id As Double, Byval body_id As Double, Byval vx As Double, ByVal vy As Double) As Double
Declare Function ep_body_vect_world_to_local_x Cdecl Alias "ep_body_vect_world_to_local_x"(ByVal world_id As Double, Byval body_id As Double, Byval vx As Double, ByVal vy As Double) As Double
Declare Function ep_body_vect_world_to_local_y Cdecl Alias "ep_body_vect_world_to_local_y"(ByVal world_id As Double, Byval body_id As Double, Byval vx As Double, ByVal vy As Double) As Double
Declare Function ep_body_boxchain_begin Cdecl Alias "ep_body_boxchain_begin"(ByVal world_id As Double, Byval body_id As Double, ByVal vertexcount As Double) As Double
Declare Function ep_body_boxchain_end Cdecl Alias "ep_body_boxchain_end"(ByVal world_id As Double, Byval body_id As Double, Byval circular As Double, Byval ignorefirstlast As Double, Byval width_top As Double, Byval width_bottom As Double, ByVal density As Double) As Double
Declare Function ep_body_boxchain_set_vertex Cdecl Alias "ep_body_boxchain_set_vertex"(ByVal world_id As Double, Byval body_id As Double, Byval index As Double, Byval x As Double, ByVal y As Double) As Double
Declare Function ep_body_boxchain_get_first Cdecl Alias "ep_body_boxchain_get_first"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_boxchain_get_last Cdecl Alias "ep_body_boxchain_get_last"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_previous Cdecl Alias "ep_body_previous"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_next Cdecl Alias "ep_body_next"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_set_uservar Cdecl Alias "ep_body_set_uservar"(ByVal world_id As Double, Byval body_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_body_get_uservar Cdecl Alias "ep_body_get_uservar"(ByVal world_id As Double, Byval body_id As Double, ByVal index As Double) As Double
Declare Function ep_body_first_shape Cdecl Alias "ep_body_first_shape"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_last_shape Cdecl Alias "ep_body_last_shape"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_shape_count Cdecl Alias "ep_body_shape_count"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_first_force Cdecl Alias "ep_body_first_force"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_last_force Cdecl Alias "ep_body_last_force"(ByVal world_id As Double, ByVal body_id As Double) As Double
Declare Function ep_body_force_count Cdecl Alias "ep_body_force_count"(ByVal world_id As Double, ByVal body_id As Double) As Double

Declare Function ep_shape_create_box Cdecl Alias "ep_shape_create_box"(ByVal world_id As Double, Byval body_id As Double, Byval w As Double, Byval h As Double, Byval x As Double, Byval y As Double, Byval rot As Double, ByVal density As Double) As Double
Declare Function ep_shape_create_line Cdecl Alias "ep_shape_create_line"(ByVal world_id As Double, Byval body_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, Byval y2 As Double, ByVal density As Double) As Double
Declare Function ep_shape_create_circle Cdecl Alias "ep_shape_create_circle"(ByVal world_id As Double, Byval body_id As Double, Byval r As Double, Byval x As Double, Byval y As Double, Byval rot As Double, ByVal density As Double) As Double
Declare Function ep_shape_create_polygon Cdecl Alias "ep_shape_create_polygon"(ByVal world_id As Double, Byval body_id As Double, Byval polygon_id As Double, Byval x As Double, Byval y As Double, Byval rot As Double, ByVal density As Double) As Double
Declare Function ep_shape_destroy Cdecl Alias "ep_shape_destroy"(ByVal world_id As Double, Byval body_id As Double, ByVal shape_id As Double) As Double
Declare Function ep_shape_exists Cdecl Alias "ep_shape_exists"(ByVal world_id As Double, Byval body_id As Double, ByVal shape_id As Double) As Double
Declare Function ep_shape_get_first_contact Cdecl Alias "ep_shape_get_first_contact"(ByVal world_id As Double, Byval body_id As Double, ByVal shape_id As Double) As Double
Declare Function ep_shape_get_last_contact Cdecl Alias "ep_shape_get_last_contact"(ByVal world_id As Double, Byval body_id As Double, ByVal shape_id As Double) As Double
Declare Function ep_shape_get_previous_contact Cdecl Alias "ep_shape_get_previous_contact"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_shape_get_next_contact Cdecl Alias "ep_shape_get_next_contact"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_shape_set_material Cdecl Alias "ep_shape_set_material"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval restitution As Double, Byval friction As Double, Byval normalvelocity As Double, ByVal tangentvelocity As Double) As Double
Declare Function ep_shape_set_collision Cdecl Alias "ep_shape_set_collision"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_shape_collision_test_box Cdecl Alias "ep_shape_collision_test_box"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval w As Double, Byval h As Double, Byval x As Double, Byval y As Double, Byval rot As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_shape_collision_test_line Cdecl Alias "ep_shape_collision_test_line"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, Byval y2 As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_shape_collision_test_circle Cdecl Alias "ep_shape_collision_test_circle"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval r As Double, Byval x As Double, Byval y As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_shape_collision_test_polygon Cdecl Alias "ep_shape_collision_test_polygon"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval polygon_id As Double, Byval x As Double, Byval y As Double, Byval rot As Double, ByVal contact_threshold As Double) As Double
Declare Function ep_shape_ray_cast Cdecl Alias "ep_shape_ray_cast"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval x As Double, Byval y As Double, Byval vx As Double, ByVal vy As Double) As Double
Declare Function ep_shape_previous Cdecl Alias "ep_shape_previous"(ByVal world_id As Double, Byval body_id As Double, ByVal shape_id As Double) As Double
Declare Function ep_shape_next Cdecl Alias "ep_shape_next"(ByVal world_id As Double, Byval body_id As Double, ByVal shape_id As Double) As Double
Declare Function ep_shape_set_uservar Cdecl Alias "ep_shape_set_uservar"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_shape_get_uservar Cdecl Alias "ep_shape_get_uservar"(ByVal world_id As Double, Byval body_id As Double, Byval shape_id As Double, ByVal index As Double) As Double

Declare Function ep_contact_destroy Cdecl Alias "ep_contact_destroy"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_exists Cdecl Alias "ep_contact_exists"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_body1 Cdecl Alias "ep_contact_get_body1"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_body2 Cdecl Alias "ep_contact_get_body2"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_shape1 Cdecl Alias "ep_contact_get_shape1"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_shape2 Cdecl Alias "ep_contact_get_shape2"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_normal_x Cdecl Alias "ep_contact_get_normal_x"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_normal_y Cdecl Alias "ep_contact_get_normal_y"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_active Cdecl Alias "ep_contact_get_point1_active"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_active Cdecl Alias "ep_contact_get_point2_active"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_x Cdecl Alias "ep_contact_get_point1_x"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_y Cdecl Alias "ep_contact_get_point1_y"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_x Cdecl Alias "ep_contact_get_point2_x"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_y Cdecl Alias "ep_contact_get_point2_y"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_separation Cdecl Alias "ep_contact_get_point1_separation"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_separation Cdecl Alias "ep_contact_get_point2_separation"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_normalforce Cdecl Alias "ep_contact_get_point1_normalforce"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_tangentforce Cdecl Alias "ep_contact_get_point1_tangentforce"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_normalforce Cdecl Alias "ep_contact_get_point2_normalforce"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_tangentforce Cdecl Alias "ep_contact_get_point2_tangentforce"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_normalveldelta Cdecl Alias "ep_contact_get_point1_normalveldelta"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point1_tangentveldelta Cdecl Alias "ep_contact_get_point1_tangentveldelta"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_normalveldelta Cdecl Alias "ep_contact_get_point2_normalveldelta"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_get_point2_tangentveldelta Cdecl Alias "ep_contact_get_point2_tangentveldelta"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_previous Cdecl Alias "ep_contact_previous"(ByVal world_id As Double, ByVal contact_id As Double) As Double
Declare Function ep_contact_next Cdecl Alias "ep_contact_next"(ByVal world_id As Double, ByVal contact_id As Double) As Double

Declare Function ep_hingejoint_create Cdecl Alias "ep_hingejoint_create"(ByVal world_id As Double, Byval body1_id As Double, Byval body2_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, Byval y2 As Double, ByVal referencerotation As Double) As Double
Declare Function ep_hingejoint_destroy Cdecl Alias "ep_hingejoint_destroy"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_exists Cdecl Alias "ep_hingejoint_exists"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_set_max_force Cdecl Alias "ep_hingejoint_set_max_force"(ByVal world_id As Double, Byval hingejoint_id As Double, ByVal maxforce As Double) As Double
Declare Function ep_hingejoint_set_motor Cdecl Alias "ep_hingejoint_set_motor"(ByVal world_id As Double, Byval hingejoint_id As Double, Byval maxmotortorque As Double, ByVal motorvel As Double) As Double
Declare Function ep_hingejoint_set_limit_settings Cdecl Alias "ep_hingejoint_set_limit_settings"(ByVal world_id As Double, Byval hingejoint_id As Double, Byval contact_threshold As Double, ByVal velocity_threshold As Double) As Double
Declare Function ep_hingejoint_set_lower_limit Cdecl Alias "ep_hingejoint_set_lower_limit"(ByVal world_id As Double, Byval hingejoint_id As Double, Byval maxlimittorque As Double, Byval rotation As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_hingejoint_set_upper_limit Cdecl Alias "ep_hingejoint_set_upper_limit"(ByVal world_id As Double, Byval hingejoint_id As Double, Byval maxlimittorque As Double, Byval rotation As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_hingejoint_set_lower_spring Cdecl Alias "ep_hingejoint_set_lower_spring"(ByVal world_id As Double, Byval hingejoint_id As Double, Byval k As Double, Byval rotation As Double, ByVal damping As Double) As Double
Declare Function ep_hingejoint_set_upper_spring Cdecl Alias "ep_hingejoint_set_upper_spring"(ByVal world_id As Double, Byval hingejoint_id As Double, Byval k As Double, Byval rotation As Double, ByVal damping As Double) As Double
Declare Function ep_hingejoint_get_body1 Cdecl Alias "ep_hingejoint_get_body1"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_get_body2 Cdecl Alias "ep_hingejoint_get_body2"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_get_rotation Cdecl Alias "ep_hingejoint_get_rotation"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_get_xforce Cdecl Alias "ep_hingejoint_get_xforce"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_get_yforce Cdecl Alias "ep_hingejoint_get_yforce"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_get_motor_torque Cdecl Alias "ep_hingejoint_get_motor_torque"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_get_limit_torque Cdecl Alias "ep_hingejoint_get_limit_torque"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_previous Cdecl Alias "ep_hingejoint_previous"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_next Cdecl Alias "ep_hingejoint_next"(ByVal world_id As Double, ByVal hingejoint_id As Double) As Double
Declare Function ep_hingejoint_set_uservar Cdecl Alias "ep_hingejoint_set_uservar"(ByVal world_id As Double, Byval hingejoint_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_hingejoint_get_uservar Cdecl Alias "ep_hingejoint_get_uservar"(ByVal world_id As Double, Byval hingejoint_id As Double, ByVal index As Double) As Double

Declare Function ep_distancejoint_create Cdecl Alias "ep_distancejoint_create"(ByVal world_id As Double, Byval body1_id As Double, Byval body2_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, ByVal y2 As Double) As Double
Declare Function ep_distancejoint_destroy Cdecl Alias "ep_distancejoint_destroy"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_exists Cdecl Alias "ep_distancejoint_exists"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_set_motor Cdecl Alias "ep_distancejoint_set_motor"(ByVal world_id As Double, Byval distancejoint_id As Double, Byval maxmotorforce As Double, ByVal motorvel As Double) As Double
Declare Function ep_distancejoint_set_limit_settings Cdecl Alias "ep_distancejoint_set_limit_settings"(ByVal world_id As Double, Byval distancejoint_id As Double, Byval contact_threshold As Double, ByVal velocity_threshold As Double) As Double
Declare Function ep_distancejoint_set_lower_limit Cdecl Alias "ep_distancejoint_set_lower_limit"(ByVal world_id As Double, Byval distancejoint_id As Double, Byval maxlimitforce As Double, Byval distance As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_distancejoint_set_upper_limit Cdecl Alias "ep_distancejoint_set_upper_limit"(ByVal world_id As Double, Byval distancejoint_id As Double, Byval maxlimitforce As Double, Byval distance As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_distancejoint_set_lower_spring Cdecl Alias "ep_distancejoint_set_lower_spring"(ByVal world_id As Double, Byval distancejoint_id As Double, Byval k As Double, Byval distance As Double, ByVal damping As Double) As Double
Declare Function ep_distancejoint_set_upper_spring Cdecl Alias "ep_distancejoint_set_upper_spring"(ByVal world_id As Double, Byval distancejoint_id As Double, Byval k As Double, Byval distance As Double, ByVal damping As Double) As Double
Declare Function ep_distancejoint_get_body1 Cdecl Alias "ep_distancejoint_get_body1"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_get_body2 Cdecl Alias "ep_distancejoint_get_body2"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_get_distance Cdecl Alias "ep_distancejoint_get_distance"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_get_motor_force Cdecl Alias "ep_distancejoint_get_motor_force"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_get_limit_force Cdecl Alias "ep_distancejoint_get_limit_force"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_previous Cdecl Alias "ep_distancejoint_previous"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_next Cdecl Alias "ep_distancejoint_next"(ByVal world_id As Double, ByVal distancejoint_id As Double) As Double
Declare Function ep_distancejoint_set_uservar Cdecl Alias "ep_distancejoint_set_uservar"(ByVal world_id As Double, Byval distancejoint_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_distancejoint_get_uservar Cdecl Alias "ep_distancejoint_get_uservar"(ByVal world_id As Double, Byval distancejoint_id As Double, ByVal index As Double) As Double

Declare Function ep_railjoint_create Cdecl Alias "ep_railjoint_create"(ByVal world_id As Double, Byval body1_id As Double, Byval body2_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2a As Double, Byval y2a As Double, Byval x2b As Double, ByVal y2b As Double) As Double
Declare Function ep_railjoint_destroy Cdecl Alias "ep_railjoint_destroy"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_exists Cdecl Alias "ep_railjoint_exists"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_set_max_normal_force Cdecl Alias "ep_railjoint_set_max_normal_force"(ByVal world_id As Double, Byval railjoint_id As Double, ByVal maxnormalforce As Double) As Double
Declare Function ep_railjoint_set_motor Cdecl Alias "ep_railjoint_set_motor"(ByVal world_id As Double, Byval railjoint_id As Double, Byval maxmotorforce As Double, ByVal motorvel As Double) As Double
Declare Function ep_railjoint_set_limit_settings Cdecl Alias "ep_railjoint_set_limit_settings"(ByVal world_id As Double, Byval railjoint_id As Double, Byval contact_threshold As Double, ByVal velocity_threshold As Double) As Double
Declare Function ep_railjoint_set_lower_limit Cdecl Alias "ep_railjoint_set_lower_limit"(ByVal world_id As Double, Byval railjoint_id As Double, Byval maxlimitforce As Double, Byval position As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_railjoint_set_upper_limit Cdecl Alias "ep_railjoint_set_upper_limit"(ByVal world_id As Double, Byval railjoint_id As Double, Byval maxlimitforce As Double, Byval position As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_railjoint_set_lower_spring Cdecl Alias "ep_railjoint_set_lower_spring"(ByVal world_id As Double, Byval railjoint_id As Double, Byval k As Double, Byval position As Double, ByVal damping As Double) As Double
Declare Function ep_railjoint_set_upper_spring Cdecl Alias "ep_railjoint_set_upper_spring"(ByVal world_id As Double, Byval railjoint_id As Double, Byval k As Double, Byval position As Double, ByVal damping As Double) As Double
Declare Function ep_railjoint_get_body1 Cdecl Alias "ep_railjoint_get_body1"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_get_body2 Cdecl Alias "ep_railjoint_get_body2"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_get_position Cdecl Alias "ep_railjoint_get_position"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_get_normal_force Cdecl Alias "ep_railjoint_get_normal_force"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_get_motor_force Cdecl Alias "ep_railjoint_get_motor_force"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_get_limit_force Cdecl Alias "ep_railjoint_get_limit_force"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_previous Cdecl Alias "ep_railjoint_previous"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_next Cdecl Alias "ep_railjoint_next"(ByVal world_id As Double, ByVal railjoint_id As Double) As Double
Declare Function ep_railjoint_set_uservar Cdecl Alias "ep_railjoint_set_uservar"(ByVal world_id As Double, Byval railjoint_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_railjoint_get_uservar Cdecl Alias "ep_railjoint_get_uservar"(ByVal world_id As Double, Byval railjoint_id As Double, ByVal index As Double) As Double

Declare Function ep_sliderjoint_create Cdecl Alias "ep_sliderjoint_create"(ByVal world_id As Double, Byval body1_id As Double, Byval body2_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2a As Double, Byval y2a As Double, Byval x2b As Double, Byval y2b As Double, ByVal rotation As Double) As Double
Declare Function ep_sliderjoint_destroy Cdecl Alias "ep_sliderjoint_destroy"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_exists Cdecl Alias "ep_sliderjoint_exists"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_set_max_combined_force Cdecl Alias "ep_sliderjoint_set_max_combined_force"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval maxnormalforce As Double, ByVal torqueradius As Double) As Double
Declare Function ep_sliderjoint_set_motor Cdecl Alias "ep_sliderjoint_set_motor"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval maxmotorforce As Double, ByVal motorvel As Double) As Double
Declare Function ep_sliderjoint_set_limit_settings Cdecl Alias "ep_sliderjoint_set_limit_settings"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval contact_threshold As Double, ByVal velocity_threshold As Double) As Double
Declare Function ep_sliderjoint_set_lower_limit Cdecl Alias "ep_sliderjoint_set_lower_limit"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval maxlimitforce As Double, Byval position As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_sliderjoint_set_upper_limit Cdecl Alias "ep_sliderjoint_set_upper_limit"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval maxlimitforce As Double, Byval position As Double, Byval restitution As Double, ByVal velocity As Double) As Double
Declare Function ep_sliderjoint_set_lower_spring Cdecl Alias "ep_sliderjoint_set_lower_spring"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval k As Double, Byval position As Double, ByVal damping As Double) As Double
Declare Function ep_sliderjoint_set_upper_spring Cdecl Alias "ep_sliderjoint_set_upper_spring"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval k As Double, Byval position As Double, ByVal damping As Double) As Double
Declare Function ep_sliderjoint_get_body1 Cdecl Alias "ep_sliderjoint_get_body1"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_get_body2 Cdecl Alias "ep_sliderjoint_get_body2"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_get_position Cdecl Alias "ep_sliderjoint_get_position"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_get_normal_force Cdecl Alias "ep_sliderjoint_get_normal_force"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_get_torque Cdecl Alias "ep_sliderjoint_get_torque"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_get_combined_force Cdecl Alias "ep_sliderjoint_get_combined_force"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_get_motor_force Cdecl Alias "ep_sliderjoint_get_motor_force"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_get_limit_force Cdecl Alias "ep_sliderjoint_get_limit_force"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_previous Cdecl Alias "ep_sliderjoint_previous"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_next Cdecl Alias "ep_sliderjoint_next"(ByVal world_id As Double, ByVal sliderjoint_id As Double) As Double
Declare Function ep_sliderjoint_set_uservar Cdecl Alias "ep_sliderjoint_set_uservar"(ByVal world_id As Double, Byval sliderjoint_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_sliderjoint_get_uservar Cdecl Alias "ep_sliderjoint_get_uservar"(ByVal world_id As Double, Byval sliderjoint_id As Double, ByVal index As Double) As Double

Declare Function ep_view_create Cdecl Alias "ep_view_create"(ByVal world_id As Double) As Double
Declare Function ep_view_destroy Cdecl Alias "ep_view_destroy"(ByVal world_id As Double, ByVal view_id As Double) As Double
Declare Function ep_view_exists Cdecl Alias "ep_view_exists"(ByVal world_id As Double, ByVal view_id As Double) As Double
Declare Function ep_view_set_rectangle Cdecl Alias "ep_view_set_rectangle"(ByVal world_id As Double, Byval view_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, ByVal y2 As Double) As Double
Declare Function ep_view_previous Cdecl Alias "ep_view_previous"(ByVal world_id As Double, ByVal view_id As Double) As Double
Declare Function ep_view_next Cdecl Alias "ep_view_next"(ByVal world_id As Double, ByVal view_id As Double) As Double
Declare Function ep_view_set_uservar Cdecl Alias "ep_view_set_uservar"(ByVal world_id As Double, Byval view_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_view_get_uservar Cdecl Alias "ep_view_get_uservar"(ByVal world_id As Double, Byval view_id As Double, ByVal index As Double) As Double

Declare Function ep_water_create Cdecl Alias "ep_water_create"(ByVal world_id As Double) As Double
Declare Function ep_water_destroy Cdecl Alias "ep_water_destroy"(ByVal world_id As Double, ByVal water_id As Double) As Double
Declare Function ep_water_exists Cdecl Alias "ep_water_exists"(ByVal world_id As Double, ByVal water_id As Double) As Double
Declare Function ep_water_set_parameters Cdecl Alias "ep_water_set_parameters"(ByVal world_id As Double, Byval water_id As Double, Byval density As Double, Byval lineardrag As Double, Byval quadraticdrag As Double, Byval xvel As Double, Byval yvel As Double, Byval gravity_x As Double, ByVal gravity_y As Double) As Double
Declare Function ep_water_set_collision Cdecl Alias "ep_water_set_collision"(ByVal world_id As Double, Byval water_id As Double, Byval collidemask1 As Double, Byval collidemask2 As Double, ByVal group As Double) As Double
Declare Function ep_water_set_rectangle Cdecl Alias "ep_water_set_rectangle"(ByVal world_id As Double, Byval water_id As Double, Byval x1 As Double, Byval y1 As Double, Byval x2 As Double, ByVal y2 As Double) As Double
Declare Function ep_water_previous Cdecl Alias "ep_water_previous"(ByVal world_id As Double, ByVal water_id As Double) As Double
Declare Function ep_water_next Cdecl Alias "ep_water_next"(ByVal world_id As Double, ByVal water_id As Double) As Double
Declare Function ep_water_set_uservar Cdecl Alias "ep_water_set_uservar"(ByVal world_id As Double, Byval water_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_water_get_uservar Cdecl Alias "ep_water_get_uservar"(ByVal world_id As Double, Byval water_id As Double, ByVal index As Double) As Double

Declare Function ep_force_create Cdecl Alias "ep_force_create"(ByVal world_id As Double, Byval body_id As Double, Byval x As Double, Byval y As Double, Byval local As Double, ByVal ignoremass As Double) As Double
Declare Function ep_force_destroy Cdecl Alias "ep_force_destroy"(ByVal world_id As Double, Byval body_id As Double, ByVal force_id As Double) As Double
Declare Function ep_force_exists Cdecl Alias "ep_force_exists"(ByVal world_id As Double, Byval body_id As Double, ByVal force_id As Double) As Double
Declare Function ep_force_set_force Cdecl Alias "ep_force_set_force"(ByVal world_id As Double, Byval body_id As Double, Byval force_id As Double, Byval xforce As Double, Byval yforce As Double, Byval torque As Double, ByVal awake As Double) As Double
Declare Function ep_force_previous Cdecl Alias "ep_force_previous"(ByVal world_id As Double, Byval body_id As Double, ByVal force_id As Double) As Double
Declare Function ep_force_next Cdecl Alias "ep_force_next"(ByVal world_id As Double, Byval body_id As Double, ByVal force_id As Double) As Double
Declare Function ep_force_set_uservar Cdecl Alias "ep_force_set_uservar"(ByVal world_id As Double, Byval body_id As Double, Byval force_id As Double, Byval index As Double, ByVal value As Double) As Double
Declare Function ep_force_get_uservar Cdecl Alias "ep_force_get_uservar"(ByVal world_id As Double, ByVal body_id As Double, Byval force_id As Double, ByVal index As Double) As Double

