include "turtlebot_vlp16_scan_2d_sim.lua"

--TRAJECTORY_BUILDER.pure_localization = true
TRAJECTORY_BUILDER.pure_localization_trimmer = {
  max_submaps_to_keep = 3,
}
POSE_GRAPH.optimize_every_n_nodes = 20
--options.published_frame = "map"

return options

