class RouteTagsController < ApplicationController
  # GET /route_tags
  # GET /route_tags.xml
  def index
    @route_tags = RouteTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @route_tags }
    end
  end

  # GET /route_tags/1
  # GET /route_tags/1.xml
  def show
    @route_tag = RouteTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @route_tag }
    end
  end

  # GET /route_tags/new
  # GET /route_tags/new.xml
  def new
    @route_tag = RouteTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @route_tag }
    end
  end

  # GET /route_tags/1/edit
  def edit
    @route_tag = RouteTag.find(params[:id])
  end

  # POST /route_tags
  # POST /route_tags.xml
  def create
    @route_tag = RouteTag.new(params[:route_tag])

    respond_to do |format|
      if @route_tag.save
        format.html { redirect_to(@route_tag, :notice => 'Route tag was successfully created.') }
        format.xml  { render :xml => @route_tag, :status => :created, :location => @route_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @route_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /route_tags/1
  # PUT /route_tags/1.xml
  def update
    @route_tag = RouteTag.find(params[:id])

    respond_to do |format|
      if @route_tag.update_attributes(params[:route_tag])
        format.html { redirect_to(@route_tag, :notice => 'Route tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @route_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /route_tags/1
  # DELETE /route_tags/1.xml
  def destroy
    @route_tag = RouteTag.find(params[:id])
    @route_tag.destroy

    respond_to do |format|
      format.html { redirect_to(route_tags_url) }
      format.xml  { head :ok }
    end
  end
end
