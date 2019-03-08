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
      if current_user.nil?
        redirect_to user_session_path
      else
        if @reservation.save
          redirect_to flats_path
        else
          render :new
        end
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to current_user
  end

  private

  def reservation_params
    params.require(:reservation).permit!
  end
end
