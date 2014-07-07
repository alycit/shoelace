module ApplicationHelper
  def datetime_format(datetime)
    datetime.strftime("%l:%M %p")
  end

  def appointment_format(datetime)
    datetime.strftime("%A %-m/%-d at %l:%M %p")
  end
end
