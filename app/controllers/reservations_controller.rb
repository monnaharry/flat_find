class ReservationsController < ApplicationController
  def show
  end

  def new
    @reservation = Reservation.new
  end

  def destroy
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @flat = Flat.find(params[:flat_id])
    @reservation.flat = @flat
    if @reservation.save
      redirect_to flats_path(@flat)
    else
      render :create
    end
  end

  def update
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
