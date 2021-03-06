class PointsController < ApplicationController
  before_filter :require_user, :only => [:new, :edit]
  before_filter :require_user_api, :only => [:create_xml, :delete]

  # GET /points/new
  # GET /points/new.xml
  def new
    @point = Point.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
  end

  def read
    point = Point.find(params[:id])

    if point.visible?
      render :text => point.to_xml.to_s, :content_type => 'text/plain'
    else
      render :text => "", :status => :gone
    end
  end

  def create_xml
    point = Point.from_xml(request.raw_post.to_s, true)
    point.user_id = @user.id

    point.save_with_history!

    render :text => point.id, :content_type => 'text/plain'
  end

  def delete
    point = Point.find(params[:id])
    new_point = Point.from_xml(request.raw_post)

    unless new_point and new_point.id == point.id
      # FIXME throw an error here
    end

    point.delete_with_history!(@user)
    render :text => point.version.to_s, :content_type => "text/plain"
  end

  # POST /points
  # POST /points.xml
  def create
    @point = Point.new(params[:point])

    respond_to do |format|
      if @point.save_with_history!
        format.html { redirect_to(@point, :notice => 'Point was successfully created.') }
        format.xml  { render :xml => @point, :status => :created, :location => @point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.xml
  def update
    @point = Point.find(params[:id])

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to(@point, :notice => 'Point was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.xml
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to(points_url) }
      format.xml  { head :ok }
    end
  end
end
