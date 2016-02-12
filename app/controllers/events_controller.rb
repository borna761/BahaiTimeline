class EventsController < ApplicationController
  def index
    @events = Event.where('id > ?', 1).order(:startYear, :startMonth, :startDay, :endYear, :endMonth, :endDay)
  end
end
