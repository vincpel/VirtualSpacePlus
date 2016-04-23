
class TutoringsController < ApplicationController
  before_action :set_tutoring, only: [:show, :edit, :update, :destroy]

  # GET /tutorings
  # GET /tutorings.json
  def index
    @tutorings = Tutoring.all
  end

  # GET /tutorings/1
  # GET /tutorings/1.json
  def show
  end

  # GET /tutorings/new
  def new
    checkUserIsLogedIn?
    @user = current_user
    @ad = Ad.new
    @tutoring = Tutoring.new
  end

  # GET /tutorings/1/edit
  def edit
  end
  
  def createfromtemplate
    checkUserIsLogedIn?
    @ad = Ad.find(params[:id]).clone
    @tutoring = @ad.tutoring.clone
    render "tutorings/new" 
  end 

  # POST /tutorings
  # POST /tutorings.json
  def create
    checkUserIsLogedIn?
    @ad = Ad.new()   
    @ad.title = params[:ad][:title]
    @ad.description = params[:ad][:description]
    @ad.price = params[:ad][:price]
    @ad.user = current_user
    @ad.tutoring = @tutoring = Tutoring.new
    @ad.attachment = params[:ad][:attachment]
    @ad.category = "tutoring"

    @tutoring.ad = @ad
    @tutoring.course = params[:tutoring][:course] 
    
    @ad.save
    @tutoring.save 

    respond_to do |format|
      if @tutoring.save
        format.html { redirect_to @tutoring, notice: 'Tutoring was successfully created.' }
        format.json { render :show, status: :created, location: @tutoring }
      else
        format.html { render :new }
        format.json { render json: @tutoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorings/1
  # PATCH/PUT /tutorings/1.json
  def update
    respond_to do |format|
      if @tutoring.update(tutoring_params)
        format.html { redirect_to @tutoring, notice: 'Tutoring was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutoring }
      else
        format.html { render :edit }
        format.json { render json: @tutoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorings/1
  # DELETE /tutorings/1.json
  def destroy
    @tutoring.destroy
    respond_to do |format|
      format.html { redirect_to tutorings_url, notice: 'Tutoring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutoring
      @tutoring = Tutoring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutoring_params
      params.fetch(:tutoring, {})
    end
end
