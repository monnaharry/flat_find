class ImagesController < ApplicationController
  def index
    @flat = Flat.find(params[:flat_id])
    @image = Image.new
    @images = @flat.images
  end

  def create
    @image = Image.new(image_params)
    @flat = Flat.find(params[:flat_id])
    @image.flat = @flat
    @image.save
    redirect_to flat_images_path(@flat.id)
  end

  def destroy
    @image = Image.find(params[:id])
    @flat = Flat.find(@image.flat.id)
    @image.destroy
    redirect_to flat_images_path(@flat)
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
