include "turtlebot_vlp16_pointcloud_2d.lua"

TRAJECTORY_BUILDER.pure_localization = true
POSE_GRAPH.optimize_every_n_nodes = 20
--options.published_frame = "map"

return options

