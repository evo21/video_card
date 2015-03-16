class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @card = Card.new
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @video = Video.new
  end

  # GET /cards/new
  def new
    @card = Card.new(card_params)
    binding.pry
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    binding.pry
    if params[:page1]
      if @card = Card.find_by_slug(params[:card][:slug])
        redirect_to card_path(@card)
      else
        @card = Card.new(card_params)
        render 'new'
      end
    else
      @card = Card.new(card_params)
      @card.save
      redirect_to card_path(@card)
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
    params.require(:card).permit(:slug, :title)
    end
  
end
