class TimelineController < ApplicationController
  def index
    @title = Eventtype.find_by_eventtype('Title').events.first
    @cycles = Eventtype.find_by_eventtype('Era').events.order(:startYear)
    @events = Eventtype.find_by_eventtype('Event').events.order(:startYear, :startMonth, :startDay, :endYear, :endMonth, :endDay)
  end
end
