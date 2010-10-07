class OldRoutePointsController < ApplicationController
  # GET /old_route_points
  # GET /old_route_points.xml
  def index
    @old_route_points = OldRoutePoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @old_route_points }
    end
  end

  # GET /old_route_points/1
  # GET /old_route_points/1.xml
  def show
    @old_route_point = OldRoutePoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @old_route_point }
    end
  end

  # GET /old_route_points/new
  # GET /old_route_points/new.xml
  def new
    @old_route_point = OldRoutePoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @old_route_point }
    end
  end

  # GET /old_route_points/1/edit
  def edit
    @old_route_point = OldRoutePoint.find(params[:id])
  end

  # POST /old_route_points
  # POST /old_route_points.xml
  def create
    @old_route_point = OldRoutePoint.new(params[:old_route_point])

    respond_to do |format|
      if @old_route_point.save
        format.html { redirect_to(@old_route_point, :notice => 'Old route point was successfully created.') }
        format.xml  { render :xml => @old_route_point, :status => :created, :location => @old_route_point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @old_route_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /old_route_points/1
  # PUT /old_route_points/1.xml
  def update
    @old_route_point = OldRoutePoint.find(params[:id])

    respond_to do |format|
      if @old_route_point.update_attributes(params[:old_route_point])
        format.html { redirect_to(@old_route_point, :notice => 'Old route point was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @old_route_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /old_route_points/1
  # DELETE /old_route_points/1.xml
  def destroy
    @old_route_point = OldRoutePoint.find(params[:id])
    @old_route_point.destroy

    respond_to do |format|
      format.html { redirect_to(old_route_points_url) }
      format.xml  { head :ok }
    end
  end
end
