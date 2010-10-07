class Point < ActiveRecord::Base 
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

      ensure_tags
      @tags.each do |tag|
        tag.version = self.version
        tag.point_id = self.id
        tag.save!
      end

      old_point = OldPoint.from_point(self)

      old_point.save_with_dependencies!
    end
  end

  def ensure_tags
    @tags = [] unless @tags
  end

  def tags
    ensure_tags
    return @tags
  end

  def add_tag(k,v)
    ensure_tags
    pt = PointTag.new
    pt.key = k
    pt.value = v
    @tags << pt
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

    pt.elements.each('tag') do |tag|
      point.add_tag(tag.attributes['k'], tag.attributes['v'])
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
    root.elements << point
    doc.elements << root

    return doc
  end

end
