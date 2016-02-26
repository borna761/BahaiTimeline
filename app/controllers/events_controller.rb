class EventsController < ApplicationController
  def index
    @events = Event.where('id > ?', 1).order(startYear: :asc, startMonth: :asc, startDay: :asc, background: :desc, endYear: :desc, endMonth: :desc, endDay: :desc)
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
      @event.update(event_params)
    end
    redirect_to events_path
  end

  def new
    if admin_signed_in?
      @event = Event.new
    else
      redirect_to events_path
    end
  end

  def create
    if admin_signed_in?
      @event = Event.new(event_params)
      @event.save
    end
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:startYear, :startMonth, :startDay, :endYear, :endMonth, :endDay, :headline, :eventtype_id, :eventgroup_id, :text, :media, :mediaCredit, :mediaCaption)
  end
end
