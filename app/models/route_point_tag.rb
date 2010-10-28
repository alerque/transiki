class RoutePointTag < ActiveRecord::Base

  def self.from_xml_node(tag_xml)
    route_point_tag = RoutePointTag.new

    route_point_tag.key = tag_xml.attributes['k']
    route_point_tag.value = tag_xml.attributes['v']

    return route_point
  end
end
