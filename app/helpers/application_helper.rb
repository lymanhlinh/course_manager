module ApplicationHelper
  def flash_message(message)
    case message
      when String
        message.html_safe
      else
        message.to_s
    end
  end
end
