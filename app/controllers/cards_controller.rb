class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]


  def index
    @card = Card.new
  end

  # GET /cards/1
  # GET /cards/1.json

  def show_by_slug
    @card = Card.find_by_slug(params[:id])
    @video = Video.new
    if @card
      render 'show'
    else
      redirect_to new_card_path
    end
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
      redirect_to cardslug_path(@card.slug)
    else
      render 'new'
    end
  end

  def update
    if @card.update(card_params) 
      flash.now[:notice] = 'Card was successfully updated.'
    else
      flash.now[:error] = 'Card was not updated.'
    end
    render 'edit'
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
      #the id passed in will be an auth_token, not a simple id
      @card = Card.find_by_auth_token(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
    params.require(:card).permit(:slug, :title, :category, :email)
    end
  
end
