class FlatsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
    raise
  end

  def update
  end

  def destroy
  end

  private

  def flat_params
    params.require(:flat).permit!
  end
end
