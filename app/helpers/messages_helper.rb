# frozen_string_literal: true

module MessagesHelper
  def display_time(time)
    time_diff = Time.now - time

    if time_diff < 1.minute
      'a few seconds ago'
    elsif time.to_date == Date.today
      "Today at #{time.strftime('%I:%M %p')}"
    elsif time.to_date == Date.yesterday
      "Yesterday at #{time.strftime('%I:%M %p')}"
    else
      time.strftime('%b %d, %Y at %I:%M %p')
    end
  end

  def message_class(message, user)
    message.sender?(user) ?  'repaly' : 'sender'
  end
end
