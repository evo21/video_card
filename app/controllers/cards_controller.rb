class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]


  def index
    @card = Card.new
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    #@card = Card.find(params[:id])
    @video = Video.new
  end

  def show_by_slug
    @card = Card.find_by_slug(params[:id])
    @video = Video.new
    render 'show'
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    if @card.save
      #redirect_to card_path(@card)
      redirect_to cardslug_path(@card.slug)
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
    params.require(:card).permit(:slug, :title, :category)
    end
  
end
