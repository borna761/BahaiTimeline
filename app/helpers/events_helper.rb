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
end
