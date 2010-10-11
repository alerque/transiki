class Route < ActiveRecord::Base
  
  # WARNING FIXME this should look basically like OSM's ways model
  # but, we're probably going to have tags on nodes in a route
  # so points have tags
  # and routes have tags
  # and points on routes have tags too
  # this means you can have a route going from point 1 to 2
  # and that route point can have some tags associated with it, like
  # time=10:40, platform=3 or something, saying at what point and what platform, on that route
  # the train or whateve is going to be there

end
