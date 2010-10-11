class OldPoint < ActiveRecord::Base
  has_many :old_point_tags

  def self.from_point(point)
    op = OldPoint.new
    op.point_id = point.id
    op.version = point.version
    op.latitude = point.latitude
    op.longitude = point.longitude
    op.visible = point.visible
    op.user_id = point.user_id    

    point.point_tags.each do |tag|
      opt = OldPointTag.new
      opt.key = tag.key
      opt.value = tag.value
      opt.version = op.version # inherit the version to avoid confusion
      opt.point_id = tag.point_id
      op.old_point_tags << opt
    end

    return op 
  end

  def save_with_dependencies!
    OldPoint.transaction do
      self.save!
    
      # FIXME do you need to iterate through the old_point_tags and save those? I don't think so...
    end
  end
end
