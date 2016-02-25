module TimelineHelper
  def create_timeline()
    # add the title
      timelineJSON = "{
            \"title\": {
              \"media\": {
                \"url\": \"" + @title.media + "\",
                \"caption\": \"" + @title.mediaCaption + "\",
                \"credit\": \"" + @title.mediaCredit + "\"
              },
              \"text\": {
                \"headline\": \"" + @title.headline + "\",
                \"text\": \"" + @title.text + "\"
              }
          },
      \"eras\": ["

    # add cycles
    @cycles.each do |cycle|
      timelineJSON += "{
      \"start_date\": {
        \"year\": \"" + cycle.startYear.to_s + "\",
        \"month\": \"" + cycle.startMonth.to_s + "\",
        \"day\": \"" + cycle.startDay.to_s + "\"
      },
      \"end_date\": {
        \"year\": \"" + cycle.endYear.to_s + "\",
        \"month\": \"" + cycle.endMonth.to_s + "\",
        \"day\": \"" + cycle.endDay.to_s + "\"
      },
      \"text\": {
        \"headline\": \"" + cycle.headline + "\",
        \"text\": \"" + cycle.text + "\"
      },
      \"unique_id\": \"" + cycle.headline.parameterize + "\"
    },"
    end

    timelineJSON = timelineJSON.chomp(',')
    timelineJSON += "],
      \"events\": ["

    # add events
    @events.each do |event|
      timelineJSON += "{
          \"media\": {
            \"url\": \"" + event.media + "\",
            \"caption\": \"" + event.mediaCaption + "\",
            \"credit\": \"" + event.mediaCredit + "\"
          },
          \"start_date\": {
            \"year\": \"" + event.startYear.to_s + "\""
            unless (event.startMonth.to_s == "")
              timelineJSON += ",
              \"month\": \"" + event.startMonth.to_s + "\""
            end
            unless (event.startDay.to_s == "")
              timelineJSON += ",
            \"day\": \"" + event.startDay.to_s + "\""
          end
          timelineJSON += "},"
          unless (event.endYear.to_s == "")
            timelineJSON += "\"end_date\": {
              \"year\": \"" + event.endYear.to_s + "\""
            unless (event.endMonth.to_s == "")
              timelineJSON += ",
              \"month\": \"" + event.endMonth.to_s + "\""
            end
            unless (event.endDay.to_s == "")
              timelineJSON += ",
              \"day\": \"" + event.endDay.to_s + "\""
            end
          timelineJSON += "},"
        end
          timelineJSON += "\"text\": {
            \"headline\": \"" + event.headline + "\",
            \"text\": \"" + event.text + "\"
          },
          \"group\": \"" + event.eventgroup.group + "\"
        },"
    end
    timelineJSON = timelineJSON.chomp(',')

      timelineJSON += "]
    }"

    return timelineJSON
  end
end
