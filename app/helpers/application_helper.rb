module ApplicationHelper
  def datetime_format(datetime)
    hour = datetime.hour
    hour = datetime.hour - 12 if hour > 12

    datetime.hour > 12 ? ending = "PM" : ending = "AM"

    "#{hour}:#{datetime.min.to_s.rjust(2, '0')} #{ending}"
  end
end
