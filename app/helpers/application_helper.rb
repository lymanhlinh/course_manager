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
end
