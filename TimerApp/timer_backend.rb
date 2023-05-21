require 'sinatra'

class TimerBackend < Sinatra::Base
  enable :sessions

  before do
    content_type 'application/json'
  end

  post '/timer/start' do
    request_body = JSON.parse(request.body.read)
    minutes = request_body['minutes']
    # Perform input validation for minutes

    # Convert minutes to seconds
    seconds = minutes.to_i * 60

    # Start the timer by sleeping for the specified duration
    sleep(seconds)

    # Return a response indicating timer completion
    { message: 'Timer complete!' }.to_json
  end

  error 400 do
    { error: 'Bad request' }.to_json
  end

  error 500 do
    { error: 'Internal server error' }.to_json
  end
end

# Start the application if run directly
run TimerBackend if __FILE__ == $0
