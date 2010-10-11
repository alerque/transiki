class Point < ActiveRecord::Base 
  has_many :point_tags

  # WARNING FIXME
  # the tags modelling is broken in this model right now
  # like OSM, we should maintain our own hash of tags internally to the model
  # but we don't yet.

  def tag_string=(ts)
    point_tags = []

    ts.split(',').each do |keyval|
      if keyval.include? '=' # throw it away if no equals
        keyvalarray = keyval.chomp.split('=')
        key = keyvalarray[0]
        val = keyvalarray[1]

        pt = PointTag.new
        pt.key = key.strip
        pt.value = val.strip
        point_tags += [pt]
      end
    end

    @tags = point_tags
  end

  def tag_string
    if self.id
      tags = PointTag.find(:all, :conditions => "point_id = #{self.id}")
      ts = ''
      first = true
      tags.each do |pt|
        ts += "," unless first
        ts += pt.key + "=" + pt.value
        first = false
      end

      return ts
    else
      return ""
    end
  end

  def validate_tag_string
    #maybe FIXME?
  end

  def save_with_history!
    Point.transaction do
      self.version = 0 unless self.version
      self.version += 1
      self.save!

      point_tags.each do |tag|
        tag.version = self.version
        tag.point_id = self.id # FIXME I think this isn't needed
        tag.save!
      end

      old_point = OldPoint.from_point(self)

      old_point.save_with_dependencies!
    end
  end

  def self.from_xml(xml, create=false)
    doc = REXML::Document.new(xml)

    doc.elements.each('//tw/point') do |pt|
      return Point.from_xml_point(pt,create)
    end
  end

  def self.from_xml_point(pt, create=false)
    point = Point.new

    point.latitude = pt.attributes['lat']
    point.longitude = pt.attributes['lon']
    point.visible = true

    pt.elements.each('tag') do |tag|
      pt = PointTag.new
      pt.key = tag.attributes['k']
      pt.value = tag.attributes['v']
      point.point_tags << pt
    end

    return point
  end

  def to_xml
    doc = REXML::Document.new
    root = REXML::Element.new 'tw'
    point = REXML::Element.new 'point'
    point.attributes['id'] = self.id
    point.attributes['version'] = self.version
    point.attributes['lat'] = self.latitude
    point.attributes['lon'] = self.longitude

    self.point_tags.each do |t|
      tag = REXML::Element.new 'tag'
      tag.attributes['k'] = t.key
      tag.attributes['v'] = t.value
      point.elements << tag
    end
    
    root.elements << point
    doc.elements << root

    return doc
  end

end
