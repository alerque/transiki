class OldPointTagsController < ApplicationController
  # GET /old_point_tags
  # GET /old_point_tags.xml
  def index
    @old_point_tags = OldPointTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @old_point_tags }
    end
  end

  # GET /old_point_tags/1
  # GET /old_point_tags/1.xml
  def show
    @old_point_tag = OldPointTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @old_point_tag }
    end
  end

  # GET /old_point_tags/new
  # GET /old_point_tags/new.xml
  def new
    @old_point_tag = OldPointTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @old_point_tag }
    end
  end

  # GET /old_point_tags/1/edit
  def edit
    @old_point_tag = OldPointTag.find(params[:id])
  end

  # POST /old_point_tags
  # POST /old_point_tags.xml
  def create
    @old_point_tag = OldPointTag.new(params[:old_point_tag])

    respond_to do |format|
      if @old_point_tag.save
        format.html { redirect_to(@old_point_tag, :notice => 'Old point tag was successfully created.') }
        format.xml  { render :xml => @old_point_tag, :status => :created, :location => @old_point_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @old_point_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /old_point_tags/1
  # PUT /old_point_tags/1.xml
  def update
    @old_point_tag = OldPointTag.find(params[:id])

    respond_to do |format|
      if @old_point_tag.update_attributes(params[:old_point_tag])
        format.html { redirect_to(@old_point_tag, :notice => 'Old point tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @old_point_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /old_point_tags/1
  # DELETE /old_point_tags/1.xml
  def destroy
    @old_point_tag = OldPointTag.find(params[:id])
    @old_point_tag.destroy

    respond_to do |format|
      format.html { redirect_to(old_point_tags_url) }
      format.xml  { head :ok }
    end
  end
end
