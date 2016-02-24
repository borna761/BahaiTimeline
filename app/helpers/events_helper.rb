module EventsHelper
  def formatted_date(year, month, day)
    if (day.to_s == "")
      if (month.to_s == "")
        pretty_date = year.to_s
      else
        pretty_date = Date::MONTHNAMES[month] + " " + year.to_s
      end
    else
      pretty_date = Date::MONTHNAMES[month] + " " + day.to_s + ", " + year.to_s
    end
    return pretty_date
  end

  def slugify(event)
    event = event.gsub(/^\s+|\s+$/, '').downcase

    fromCharacters = "ãàáäâẽèéëêìíïîõòóöôùúüûñç·/_,:;"
    toCharacters = "aaaaaeeeeeiiiiooooouuuunc------"

    for i in 0..fromCharacters.length - 1
      event = event.gsub(fromCharacters[i], toCharacters[i])
    end

    event = event.gsub(/[^a-z0-9 -]/, '').gsub(/\s+/, '-').gsub(/-+/, '-')

    event = event.gsub(/^([0-9])/,'_$1')

    return event
  end
end
