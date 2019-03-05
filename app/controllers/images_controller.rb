class ImagesController < ApplicationController
  def index

  end

  def create
    @image = Image.new(image_params)
    @flat = Flat.find(params[:flat_id])
    @image.flat = @flat
    @image.save
    redirect_to flat_images_path(@flat.id)
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
