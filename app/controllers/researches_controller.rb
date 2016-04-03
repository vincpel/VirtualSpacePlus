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
    ads = nil

    if criterias["in"] == "book"
      ads = researchBook(criterias) 

    elsif criterias["in"] == "electronic"
      ads = researchElectronic(criterias)
    elsif criterias["in"] == "tutoring"
      ads = researchTutoring(criterias)
    else  
      ads = Ad.all.select do |ad|
        ad.title =~ /#{criterias['researche']}/i || ad.description =~ /#{criterias['researche']}/i 
      end
    end
    ads = ads.sort_by { |a| a.price} if criterias['sortby'] == "price"
    ads = ads.sort_by { |a| a.created_at} if criterias['sortby'] == "date"
    
    @ads = ads
  end

  # GET /researches/new
  def new
  end
  
  def newAdvanced
  end

  # GET /researches/1/edit
  def edit
  end

  # POST /researches
  # POST /researches.json
  def create
    @research = Research.create(:criteria => params[:researches].to_s) #TODO vulnerable to sql injeciton
    redirect_to action: "show", id: @research.id
  end


  private

    def researchBook(acriteria)
      @ads = Tutoring.all.select do |elec|
         if acriteria["book"]["ISBN"] != ""
            elec.model =~ /#{acriteria["book"]["ISBN"] }/i
         end
      end 
      @ads.map { |e| e.ad }
    end

    def researchTutoring(acriteria)
      @ads = Tutoring.all.select do |elec|
         if acriteria["tutoring"]["course"] != ""
            elec.model =~ /#{acriteria["tutoring"]["course"] }/i
         end
      end 
      @ads.map { |e| e.ad }
    end

    def researchElectronic(acriteria)
      @ads = Electronic.all.select do |elec|
         if acriteria["electronic"]["brand"] != ""
            elec.brand =~ /#{acriteria["electronic"]["brand"] }/i
         end
      end +  Electronic.all.select do |elec|
         if acriteria["electronic"]["model"] != ""
            elec.model =~ /#{acriteria["electronic"]["model"] }/i
         end
      end 
      @ads.map { |e| e.ad }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_research
      #@research = Research.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_params
      params.fetch(:research, {})
    end
end
