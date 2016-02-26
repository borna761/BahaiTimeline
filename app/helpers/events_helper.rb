module EventsHelper
  def formatted_date(year, month, day)
    if (day.to_s == "")
      if (month.to_s == "")
        pretty_date = zeroYear(year)
      else
        pretty_date = Date::MONTHNAMES[zeroMonth(month).to_i] + " " + zeroYear(year)
      end
    else
      pretty_date = Date::MONTHNAMES[zeroMonth(month).to_i] + " " + zeroDay(day) + ", " + zeroYear(year)
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

  private
  def zeroYear(year)
    return (year == 0 ? Date.current.year.to_s : year.to_s)
  end

  def zeroMonth(month)
    return (month == 0 ? Date.current.month.to_s : month.to_s)
  end

  def zeroDay(day)
    return (day == 0 ? Date.current.day.to_s : day.to_s)
  end
end
