class WorkgroupController < ApplicationController
  before_action :set_workgroup, only: [:show, :edit, :update, :destroy]

  # GET /workgroups
  # GET /workgroups.json
  def index
    @workgroups = Workgroup.all
  end

  # GET /workgroups/1
  # GET /workgroups/1.json
  def show
  end

  # GET /workgroups/new
  def new
    checkUserIsLogedIn?
    @user = current_user
    @ad = Ad.new
    @workgroup = Workgroup.new
  end

  # GET /workgroups/1/edit
  def edit
  end

  # POST /workgroups
  # POST /workgroups.json
  def create
    checkUserIsLogedIn?
    @ad = Ad.new()   
    @ad.title = params[:ad][:title]
    @ad.description = params[:ad][:description]
    @ad.user = current_user
    @ad.workgroup = @workgroup = Workgroup.new
    @ad.attachment = params[:ad][:attachment]

    @workgroup.ad = @ad
    @workgroup.course = params[:workgroup][:course] 
    
    @ad.save
    @workgroup.save 

    respond_to do |format|
      if @workgroup.save
        format.html { redirect_to @workgroup, notice: 'Workgroup was successfully created.' }
        format.json { render :show, status: :created, location: @workgroup }
      else
        format.html { render :new }
        format.json { render json: @workgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workgroups/1
  # PATCH/PUT /workgroups/1.json
  def update
    respond_to do |format|
      if @workgroup.update(workgroup_params)
        format.html { redirect_to @workgroup, notice: 'Workgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @workgroup }
      else
        format.html { render :edit }
        format.json { render json: @workgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workgroups/1
  # DELETE /workgroups/1.json
  def destroy
    @workgroup.destroy
    respond_to do |format|
      format.html { redirect_to workgroups_url, notice: 'Workgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workgroup
      @workgroup = Workgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workgroup_params
      params.fetch(:workgroup, {})
    end
end
