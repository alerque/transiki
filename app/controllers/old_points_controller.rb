class OldPointsController < ApplicationController
  # GET /old_points
  # GET /old_points.xml
  def index
    @old_points = OldPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @old_points }
    end
  end

  # GET /old_points/1
  # GET /old_points/1.xml
  def show
    @old_point = OldPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @old_point }
    end
  end

  # GET /old_points/new
  # GET /old_points/new.xml
  def new
    @old_point = OldPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @old_point }
    end
  end

  # GET /old_points/1/edit
  def edit
    @old_point = OldPoint.find(params[:id])
  end

  # POST /old_points
  # POST /old_points.xml
  def create
    @old_point = OldPoint.new(params[:old_point])

    respond_to do |format|
      if @old_point.save
        format.html { redirect_to(@old_point, :notice => 'Old point was successfully created.') }
        format.xml  { render :xml => @old_point, :status => :created, :location => @old_point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @old_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /old_points/1
  # PUT /old_points/1.xml
  def update
    @old_point = OldPoint.find(params[:id])

    respond_to do |format|
      if @old_point.update_attributes(params[:old_point])
        format.html { redirect_to(@old_point, :notice => 'Old point was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @old_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /old_points/1
  # DELETE /old_points/1.xml
  def destroy
    @old_point = OldPoint.find(params[:id])
    @old_point.destroy

    respond_to do |format|
      format.html { redirect_to(old_points_url) }
      format.xml  { head :ok }
    end
  end
end
