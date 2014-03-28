class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @can_accept = !session[:c_org].nil? && @offer.charity_id.nil?
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @retailers = Retailer.all
    @categories = Category.all
  end

  # GET /offers/1/edit
  def edit
    @retailers = Retailer.all
    @categories = Category.all
  end

  def accept
    @offer = Offer.find(params[:offer_id])
    @offer.charity_id = session[:c_org].id
    @offer.save
    redirect_to offer_path @offer
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new

    @offer.retailer = session[:r_org]
    @offer.title = offer_params[:title]
    @offer.description = offer_params[:description]
    @offer.location = offer_params[:location]
    @offer.cover_image = offer_params[:cover_image]
    @offer.category = Category.find(offer_params[:category])

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @offer }
      else
        format.html { render action: 'new' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(
        :title,
        :description,
        :location,
        :cover_image,
        :retailer,
        :category
        )
    end
end
