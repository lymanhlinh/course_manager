module ApplicationHelper
  def flash_message(message)
    case message
      when String
        message.html_safe
      else
        message.to_s
    end
  end

  def random_string(length)
    rand(36**length).to_s(36)
  end

  def currency_format(number)
    number_to_currency(number, unit: 'vnd', precision: 0, format: "%n %u")
  end

  def date_format(time)
    time.strftime('%d/%m/%Y')
  end
end
