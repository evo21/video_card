class VideosController < ApplicationController
  
  def create
  	@card = Card.find(video_params[:card_id])

  	@video = Video.new(video_params)

        # going straight to the params hash because camera tag nests it within weird subhashes
        @video.thumb = params[:video][:qvga][:thumb]
        @video.small_thumb = params[:video][:qvga][:small_thumb]

  	@video.save
  	redirect_to card_path(@card)
  end

  def video_params
  	params.require(:video).permit(:caption, :contributor, :card_id, :video_uuid)
  end
end
