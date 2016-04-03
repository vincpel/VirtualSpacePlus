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
    criterias = eval(@research.criteria)
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

    if ads
      ads = ads.sort_by { |a| a.price}      if criterias['sortby'] == "price"
      ads = ads.sort_by { |a| a.created_at} if criterias['sortby'] == "date"
      ads = ads.sort_by { |a| a.title}      if criterias['sortby'] == "title"
    end
    
    @ads = ads || []
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
    @research = Research.create(:criteria => params[:researches].to_s)
    redirect_to action: "show", id: @research.id
  end


  private

    def researchBook(acriteria)
      ads = nil
      if acriteria["book"]["ISBN"] == ""
        ads = Book.all 
      else
        ads = Book.all.select do |elec|
              elec.ISBN =~ /#{acriteria["book"]["ISBN"] }/i
        end 
      end
      ads.map { |e| e.ad }
    end

    def researchTutoring(acriteria)
      ads = nil
      if acriteria["tutoring"]["course"] == ""
        ads = Tutoring.all
      else
        ads = Tutoring.all.select do |elec|
            elec.course =~ /#{acriteria["tutoring"]["course"] }/i
        end 
      end
      ads.map { |e| e.ad }
    end

    def researchElectronic(acriteria)
      ads = nil
      if acriteria["electronic"]["brand"] == "" && acriteria["electronic"]["model"] == ""
        ads = Electronic.all
      else
        ads = Electronic.all.select do |elec|
          elec.brand =~ /#{acriteria["electronic"]["brand"] }/i  if acriteria["electronic"]["brand"] != ""
        end +  Electronic.all.select do |elec|
          elec.model =~ /#{acriteria["electronic"]["model"] }/i  if acriteria["electronic"]["model"] != ""
        end
      end 
      ads = ads.reduce([]) { |memo, e| e.nil? ? memo : memo << e }
      ads.map { |e| e.ad }
    end

    def set_research
      #@research = Research.find(params[:id])
    end

    def research_params
      params.fetch(:research, {})
    end
end
