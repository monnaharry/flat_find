class FlatsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "address ILIKE :query OR description ILIKE :query"
      @flats = Flat.where.not(latitude: nil, longitude: nil).where(sql_query, query: "%#{params[:query]}%")
    else
      @flats = Flat.where.not(latitude: nil, longitude: nil)
    end
      @markers = @flats.map do |flat|
        {
          lng: flat.longitude,
          lat: flat.latitude,
          flice: flat.price,
          infoWindow: render_to_string(partial: "infowindow", locals: { flat: flat })
        }
      end
  end

  def show
    @flat = Flat.find(params[:id])
    @user = @flat.user
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_images_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    redirect_to flats_path
  end

  # to be deleted and replaced with a default value in table
  # def property_type_placeholder
  #   @flat = Flat.find(params[:id])
  #   !@flat.property_type.nil? ? @flat.property_type : "Entire House"
  # end

  private

  def flat_params
    params.require(:flat).permit!
  end
end









