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

    @ads = Ad.all

    if criterias["researche"] == ""
      @ad
    elsif criterias["in"] == "book"
      @ads = researchBook(criterias)  
    elsif criterias["in"] == "electronic"
      @ads = researchElectronic(criterias)
    elsif criterias["in"] == "tutoring"
      @ads = researchTutoring(criterias)
    else  criterias["in"] == "electronic"
      @ads = Ad.where(title:  criterias["researche"])
    end
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
      @ads = Book.where( ISBN:  acriteria["Book"][":ISBN"]).map do |book|
        book.ad
      end
    end

    def researchTutoring(acriteria)
      @ads = Tutoring.where( model:  acriteria["tutoring"]["course"]).map do |tuto|
        tuto.ad
      end
    end

    def researchElectronic(acriteria)
      @ads = Electronic.where( brand:  acriteria["electronic"]["brand"],
                               model: acriteria["electronic"]["model"] ).map do |elec|
        elec.ad
      end
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
