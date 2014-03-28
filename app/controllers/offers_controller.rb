class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @offers = params[:category_id].nil? ? Offer.all(:conditions => {:charity_id => nil}) : Offer.all(:conditions => {:charity_id => nil, :category_id => params[:category_id]})
    @categories = Category.all()
    @active_category_name = params[:category_id].nil? ? "All" : Category.find(params[:category_id]).name
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @can_accept = !session[:c_org].nil? && @offer.charity_id.nil?
    @can_edit = !session[:r_org].nil? && @offer.retailer_id == session[:r_org].id
    @can_endorse = !session[:r_org].nil? && @offer.retailer_id == session[:r_org].id && @offer.charity_id.present?

    @endorsement = Endorsement.new
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
    redirect_to offer_path(@offer), notice: 'Offer was successfully accepted.'
  end

  def unaccept
    @offer = Offer.find(params[:offer_id])
    @offer.charity_id = nil
    @offer.save
    redirect_to offer_path(@offer), notice: 'Offer was successfully removed.'
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
    @offer.category = Category.find_by_id(offer_params[:category_id])
    @offer.offer_ends = DateTime.parse(offer_params[:offer_ends], "dd/mm/YYYY") if offer_params[:offer_ends]
    @offer.delivery_options = offer_params[:delivery_options]

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
        :category,
        :offer_ends,
        :delivery_options
        )
    end
end
