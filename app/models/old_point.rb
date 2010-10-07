class OldPoint < ActiveRecord::Base

  def self.from_point(point)
    op = OldPoint.new
    op.point_id = point.id
    op.version = point.version
    op.latitude = point.latitude
    op.longitude = point.longitude
    

    #FIXME copy over the old tags too

    tags = []

    point.tags.each do |tag|
      opt = OldPointTag.new
      opt.key = tag.key
      opt.value = tag.value
      opt.version = tag.version
      opt.point_id = tag.point_id
      tags += [opt]
    end

    op.tags = tags

    return op 
  end

  def tags
    ensure_tags
    return @tags
  end

  def tags=(tags)
    @tags = tags
  end

  def save_with_dependencies!
    OldPoint.transaction do
      self.save!
      @tags.each do |tag|
        tag.save!
      end
    end
  end

end
