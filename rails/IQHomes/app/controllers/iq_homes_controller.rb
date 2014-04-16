class IQHomesController < ApplicationController
  # GET /iq_homes
  # GET /iq_homes.xml
  def index
    @iq_homes = IQHome.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @iq_homes }
    end
  end

  # GET /iq_homes/1
  # GET /iq_homes/1.xml
  def show
    @iq_home = IQHome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @iq_home }
    end
  end

  # GET /iq_homes/new
  # GET /iq_homes/new.xml
  def new
    @iq_home = IQHome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @iq_home }
    end
  end

  # GET /iq_homes/1/edit
  def edit
    @iq_home = IQHome.find(params[:id])
  end

  # POST /iq_homes
  # POST /iq_homes.xml
  def create
    @iq_home = IQHome.new(params[:iq_home])

    respond_to do |format|
      if @iq_home.save
        format.html { redirect_to(@iq_home, :notice => 'IQHome was successfully created.') }
        format.xml  { render :xml => @iq_home, :status => :created, :location => @iq_home }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @iq_home.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /iq_homes/1
  # PUT /iq_homes/1.xml
  def update
    @iq_home = IQHome.find(params[:id])

    respond_to do |format|
      if @iq_home.update_attributes(params[:iq_home])
        format.html { redirect_to(@iq_home, :notice => 'IQHome was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @iq_home.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /iq_homes/1
  # DELETE /iq_homes/1.xml
  def destroy
    @iq_home = IQHome.find(params[:id])
    @iq_home.destroy

    respond_to do |format|
      format.html { redirect_to(iq_homes_url) }
      format.xml  { head :ok }
    end
  end
end
