class RoutePointTagsController < ApplicationController
  # GET /route_point_tags
  # GET /route_point_tags.xml
  def index
    @route_point_tags = RoutePointTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @route_point_tags }
    end
  end

  # GET /route_point_tags/1
  # GET /route_point_tags/1.xml
  def show
    @route_point_tag = RoutePointTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @route_point_tag }
    end
  end

  # GET /route_point_tags/new
  # GET /route_point_tags/new.xml
  def new
    @route_point_tag = RoutePointTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @route_point_tag }
    end
  end

  # GET /route_point_tags/1/edit
  def edit
    @route_point_tag = RoutePointTag.find(params[:id])
  end

  # POST /route_point_tags
  # POST /route_point_tags.xml
  def create
    @route_point_tag = RoutePointTag.new(params[:route_point_tag])

    respond_to do |format|
      if @route_point_tag.save
        format.html { redirect_to(@route_point_tag, :notice => 'Route point tag was successfully created.') }
        format.xml  { render :xml => @route_point_tag, :status => :created, :location => @route_point_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @route_point_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /route_point_tags/1
  # PUT /route_point_tags/1.xml
  def update
    @route_point_tag = RoutePointTag.find(params[:id])

    respond_to do |format|
      if @route_point_tag.update_attributes(params[:route_point_tag])
        format.html { redirect_to(@route_point_tag, :notice => 'Route point tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @route_point_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /route_point_tags/1
  # DELETE /route_point_tags/1.xml
  def destroy
    @route_point_tag = RoutePointTag.find(params[:id])
    @route_point_tag.destroy

    respond_to do |format|
      format.html { redirect_to(route_point_tags_url) }
      format.xml  { head :ok }
    end
  end
end
