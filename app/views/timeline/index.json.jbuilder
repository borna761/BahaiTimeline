json.title do
  json.media do
    json.url @title.media
    json.caption @title.mediaCaption
    json.credit @title.mediaCredit
  end

  json.text do
    json.text @title.text
    json.headline @title.headline
  end
end

json.eras @cycles do |cycle|
  json.start_date do
    json.year cycle.startYear
    json.month cycle.startMonth
    json.day cycle.startDay
  end
  json.end_date do
    json.year cycle.endYear
    json.month cycle.endMonth
    json.day cycle.endDay
  end
  json.text do
    json.headline cycle.headline
    json.text cycle.text
  end
end

json.events @events do |event|
  json.media do
    json.url event.media
    json.caption event.mediaCaption
    json.credit event.mediaCredit
  end
  json.start_date do
    json.year event.startYear
    unless (event.startMonth.nil?)
      json.month event.startMonth
    end
    unless (event.startDay.nil?)
      json.day event.startDay
    end
  end
  json.end_date do
    if event.endYear == 0
      json.year Date.current.year
      json.month Date.current.month
      json.day Date.current.day
    else
      unless (event.endYear.nil?)
        json.year event.endYear
      end
      unless (event.endMonth.nil?)
        json.month event.endMonth
      end
      unless (event.endDay.nil?)
        json.day event.endDay
      end
    end
  end
  json.text do
    json.headline event.headline
    json.text event.text
  end
  json.group event.eventgroup.group
end
