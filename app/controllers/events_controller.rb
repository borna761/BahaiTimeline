class EventsController < ApplicationController
  def index
    @events = Event.where('id > ?', 1).order(startYear: :asc, startMonth: :asc, startDay: :asc, background: :desc, endYear: :desc, endMonth: :desc, endDay: :desc)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:startYear, :startMonth, :startDay, :endYear, :endMonth, :endDay, :headline, :text, :media, :mediaCredit, :mediaCaption)
    @event.update(event_params)
    redirect_to events_path
  end
end
