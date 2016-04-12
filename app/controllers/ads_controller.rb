class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /adds
  # GET /adds.json
  def index
    @ads = Ad.all
  end

  # GET /adds/1
  # GET /adds/1.json
  def show
  end

  # GET /adds/new
  def new
    checkUserIsLogedIn?
    @user = User.find(current_user.id)
  end

  # GET /adds/1/edit
  def edit
    checkUserIsLogedIn?
    @user = User.find(current_user.id)
    @ads = Ad.find(params[:id])
  end

  # POST /adds
  # POST /adds.json
  def create
    checkUserIsLogedIn?
    @user = User.find(params[:user_id])
    @ad = @user.ads.new(params.require(:ad).permit(:title, :description))
    #@ad.type = 'book' # we will change this in the futre
    @ad.save
    redirect_to user_path(@user)
  end

  # PATCH/PUT /adds/1
  # PATCH/PUT /adds/1.json
  def update
    checkUserIsLogedIn?
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Add was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adds/1
  # DELETE /adds/1.json
  def destroy
    checkUserIsLogedIn?
    @ad.destroy
    redirect_to user_path(@ad.user)

    #respond_to do |format|
    #  format.html { redirect_to adds_url, notice: 'Add was successfully destroyed.' }
    #  format.json { head :no_content }
    #end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title,:description,:price,:attachment,:sold)
    end
end
