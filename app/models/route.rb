class Route < ActiveRecord::Base
  has_many :route_points
  has_many :route_tags

  def self.from_xml(xml, create=false)
    doc = REXML::Document.new(xml)

    doc.elements.each('//tw/route') do |route_xml|
      return Route.from_xml_route(route_xml,create)
    end
  end

  def self.from_xml_route(route_xml, create=false)
    route = Route.new

    route.visible = true # FIXME the db should default to true for all these

    route_xml.elements.each('points/pt') do |pt|
      rp = RoutePoint.from_xml_node(pt)
      route.route_points << rp
    end

    route_xml.elements.each('tags/tag') do |tag|
      rt = RouteTag.from_xml_node(tag)
      route.route_tags << rt
    end

    return route
  end

  def save_with_history!
    self.save!

    # FIXME save the history too
  end

end
