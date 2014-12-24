class Tracker

  def initialize
    @conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
  end

  def pivotal_project(current_user)
    response = @conn.get do |req|
      req.url "/services/v5/projects/1190120"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = ENV['TRACKER_TOKEN']
    end
    if response.success?
      json_response = JSON.parse(response.body, symbolize_names: true)
    end
  end

  def pivotal_stories(current_user)
    response = @conn.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/projects/1190120/stories"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = ENV['TRACKER_TOKEN']
    end
    if response.success?
      json_response = JSON.parse(response.body, symbolize_names: true)
    end
  end

end
