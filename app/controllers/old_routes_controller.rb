class OldRoutesController < ApplicationController
  # GET /old_routes
  # GET /old_routes.xml
  def index
    @old_routes = OldRoute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @old_routes }
    end
  end

  # GET /old_routes/1
  # GET /old_routes/1.xml
  def show
    @old_route = OldRoute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @old_route }
    end
  end

  # GET /old_routes/new
  # GET /old_routes/new.xml
  def new
    @old_route = OldRoute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @old_route }
    end
  end

  # GET /old_routes/1/edit
  def edit
    @old_route = OldRoute.find(params[:id])
  end

  # POST /old_routes
  # POST /old_routes.xml
  def create
    @old_route = OldRoute.new(params[:old_route])

    respond_to do |format|
      if @old_route.save
        format.html { redirect_to(@old_route, :notice => 'Old route was successfully created.') }
        format.xml  { render :xml => @old_route, :status => :created, :location => @old_route }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @old_route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /old_routes/1
  # PUT /old_routes/1.xml
  def update
    @old_route = OldRoute.find(params[:id])

    respond_to do |format|
      if @old_route.update_attributes(params[:old_route])
        format.html { redirect_to(@old_route, :notice => 'Old route was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @old_route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /old_routes/1
  # DELETE /old_routes/1.xml
  def destroy
    @old_route = OldRoute.find(params[:id])
    @old_route.destroy

    respond_to do |format|
      format.html { redirect_to(old_routes_url) }
      format.xml  { head :ok }
    end
  end
end
