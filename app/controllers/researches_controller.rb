class ResearchesController < ApplicationController
  before_action :set_research, only: [:show, :edit, :update, :destroy]

  # GET /researches
  # GET /researches.json
  def index
    @ads = Ad.all
  end

  # GET /researches/1
  # GET /researches/1.json
  def show
    @research = Research.find_by_id(params[:id])
    criterias = eval(@research.criteria) # vulneralbe to sql injection #TODO
    byebug
    #...
    @ads = [Ad.find_by_title(criterias["researche"])]
  end

  # GET /researches/new
  def new
  end

  # GET /researches/1/edit
  def edit
  end

  # POST /researches
  # POST /researches.json
  def create
    @research = Research.create(:criteria => params[:researches].to_s) #TODO vulnerable to sql injeciton
    
    @ads = Ad.all
    redirect_to action: "show", id: @research.id
    
  end

  # PATCH/PUT /researches/1
  # PATCH/PUT /researches/1.json
  def update
    respond_to do |format|
      if @research.update(research_params)
        format.html { redirect_to @research, notice: 'Research was successfully updated.' }
        format.json { render :show, status: :ok, location: @research }
      else
        format.html { render :edit }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /researches/1
  # DELETE /researches/1.json
  def destroy
    @research.destroy
    respond_to do |format|
      format.html { redirect_to researches_url, notice: 'Research was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research
      #@research = Research.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_params
      params.fetch(:research, {})
    end
end
