class ArtworksController < ApplicationController
  def create
    artwork = Artwork.new(artwork_params)
  end 

  private 

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end 
end 