class RoutePoint < ActiveRecord::Base
  has_many :route_point_tags

  def self.from_xml_node(rp_xml)
    route_point = RoutePoint.new

    route_point.id = rp_xml.attributes['id'].to_i

    rp_xml.elements.each('tags/tag') do |tag|
      rpt = RoutePointTag.from_xml_node(tag)
      route_point.route_point_tags << rpt
    end

    return route_point
  end



end
