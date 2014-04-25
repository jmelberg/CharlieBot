class CharlieBot

  attr_reader :prayer_requests

  def initialize(options={})
    @prayer_requests = []
  end

  def say_hello(name_string)
    "Hello #{name_string}!"
  end

  def add_prayer(request_paramaters)
    @prayer_requests.push(request_paramaters)
  end

  def delete_all_prayers()
    @prayer_requests = []
  end

  def delete_one_prayer(delete_me)
    if prayer_requests.match(delete_me)
     prayer_requestes.delete_at(prayer_requests.match(delete_me))
    end
  end


  def eat_message(message_string)
   add_prayer_matcher = /^[$]CharlieBot add prayer\s*<(.*)>/

   if add_prayer_matcher.match(message_string)
    request = add_prayer_matcher.match(message_string)[1]
    add_prayer(:user => 'Me', :request => request)
   else
    send_error_message
   end
  end

  private

  def send_error_message
    nil
  end




end
