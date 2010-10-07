class PointTagsController < ApplicationController
  # GET /point_tags
  # GET /point_tags.xml
  def index
    @point_tags = PointTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @point_tags }
    end
  end

  # GET /point_tags/1
  # GET /point_tags/1.xml
  def show
    @point_tag = PointTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @point_tag }
    end
  end

  # GET /point_tags/new
  # GET /point_tags/new.xml
  def new
    @point_tag = PointTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point_tag }
    end
  end

  # GET /point_tags/1/edit
  def edit
    @point_tag = PointTag.find(params[:id])
  end

  # POST /point_tags
  # POST /point_tags.xml
  def create
    @point_tag = PointTag.new(params[:point_tag])

    respond_to do |format|
      if @point_tag.save
        format.html { redirect_to(@point_tag, :notice => 'Point tag was successfully created.') }
        format.xml  { render :xml => @point_tag, :status => :created, :location => @point_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @point_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /point_tags/1
  # PUT /point_tags/1.xml
  def update
    @point_tag = PointTag.find(params[:id])

    respond_to do |format|
      if @point_tag.update_attributes(params[:point_tag])
        format.html { redirect_to(@point_tag, :notice => 'Point tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @point_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /point_tags/1
  # DELETE /point_tags/1.xml
  def destroy
    @point_tag = PointTag.find(params[:id])
    @point_tag.destroy

    respond_to do |format|
      format.html { redirect_to(point_tags_url) }
      format.xml  { head :ok }
    end
  end
end
