class VideosController < ApplicationController
  
  def create
  	@card = Card.find(video_params[:card_id])

  	@video = Video.new(video_params)

        # going straight to the params hash because camera tag nests it within weird subhashes
        @video.thumb = params[:video][:qvga][:thumb]
        @video.small_thumb = params[:video][:qvga][:small_thumb]

  	@video.save
        redirect_to cardslug_path(@card.slug)
  end

  def show
    @video = Video.find_by_auth_token(params[:id])
  end


  def destroy
    @video = Video.find_by_auth_token(params[:id])
    card = @video.card
#    @video.destroy

    # get some info about the calling controller / method
    source_page = Rails.application.routes.recognize_path(request.referrer)

    if source_page[:controller] == 'videos'
      redirect_to cardslug_path(card.slug), notice: 'Video was successfully destroyed.' 
    else
      # this means the destroy request came from the edit card page
      redirect_to :back, notice: 'Video was successfully destroyed.' 
    end
  end

  def video_params
  	params.require(:video).permit(:contributor, :card_id, :video_uuid)
  end
end
