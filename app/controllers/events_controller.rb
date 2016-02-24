class EventsController < ApplicationController
  def index
    @events = Event.where('id > ?', 1).order(startYear: :asc, startMonth: :asc, startDay: :asc, endYear: :desc, endMonth: :desc, endDay: :desc)
  end

  def edit
    if admin_signed_in?
      @event = Event.find(params[:id])
    else
      redirect_to events_path
    end
  end

  def update
    if admin_signed_in?
      @event = Event.find(params[:id])
      event_params = params.require(:event).permit(:startYear, :startMonth, :startDay, :endYear, :endMonth, :endDay, :headline, :text, :media, :mediaCredit, :mediaCaption)
      @event.update(event_params)
    end
    redirect_to events_path
  end
end
