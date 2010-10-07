class OldRouteTagsController < ApplicationController
  # GET /old_route_tags
  # GET /old_route_tags.xml
  def index
    @old_route_tags = OldRouteTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @old_route_tags }
    end
  end

  # GET /old_route_tags/1
  # GET /old_route_tags/1.xml
  def show
    @old_route_tag = OldRouteTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @old_route_tag }
    end
  end

  # GET /old_route_tags/new
  # GET /old_route_tags/new.xml
  def new
    @old_route_tag = OldRouteTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @old_route_tag }
    end
  end

  # GET /old_route_tags/1/edit
  def edit
    @old_route_tag = OldRouteTag.find(params[:id])
  end

  # POST /old_route_tags
  # POST /old_route_tags.xml
  def create
    @old_route_tag = OldRouteTag.new(params[:old_route_tag])

    respond_to do |format|
      if @old_route_tag.save
        format.html { redirect_to(@old_route_tag, :notice => 'Old route tag was successfully created.') }
        format.xml  { render :xml => @old_route_tag, :status => :created, :location => @old_route_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @old_route_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /old_route_tags/1
  # PUT /old_route_tags/1.xml
  def update
    @old_route_tag = OldRouteTag.find(params[:id])

    respond_to do |format|
      if @old_route_tag.update_attributes(params[:old_route_tag])
        format.html { redirect_to(@old_route_tag, :notice => 'Old route tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @old_route_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /old_route_tags/1
  # DELETE /old_route_tags/1.xml
  def destroy
    @old_route_tag = OldRouteTag.find(params[:id])
    @old_route_tag.destroy

    respond_to do |format|
      format.html { redirect_to(old_route_tags_url) }
      format.xml  { head :ok }
    end
  end
end
