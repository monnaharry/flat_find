class ReservationsController < ApplicationController
  def show
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @reservation = Reservation.new
  end

  def destroy
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @flat = Flat.find(params[:flat_id])
    @reservation.flat = @flat
    @reservation.user = current_user
    if @reservation.save
      redirect_to flats_path
    else
      render :new
    end
    raise
  end

  def update
  end

  private

  def reservation_params
    params.require(:reservation).permit!
  end
end
