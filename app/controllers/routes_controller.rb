class RoutesController < ApplicationController
  before_filter :require_user_api, :only => [:create_xml]

  def create_xml
    route = Route.from_xml(request.raw_post.to_s, true)
    route.user_id = @user.id

    route.save_with_history!

    render :text => route.id, :content_type => 'text/plain'
  end

end
