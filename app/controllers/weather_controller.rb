class WeatherController<ApplicationController
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user

  include WeatherHelper

  def weekly
    unless (@user.address_zip == nil) || (@user.address_zip.lstrip.empty?)
      @data_line_graph = [[Time.now, weather_x_days_ago_hash(0)["temperatureMax"]],
      [Time.now+1.day, weather_x_days_ago_hash(-1)["temperatureMax"]],
      [Time.now+2.day, weather_x_days_ago_hash(-2)["temperatureMax"]],
      [Time.now+3.day, weather_x_days_ago_hash(-3)["temperatureMax"]],
      [Time.now+4.day, weather_x_days_ago_hash(-4)["temperatureMax"]],
      [Time.now+5.day, weather_x_days_ago_hash(-5)["temperatureMax"]],
      [Time.now+6.day, weather_x_days_ago_hash(-6)["temperatureMax"]],
      [Time.now+7.day, weather_x_days_ago_hash(-7)["temperatureMax"]],
      ]
    end
  end

  def daily
  end

  def cloud_coverage
    unless (@user.address_zip == nil) || (@user.address_zip.lstrip.empty?)
      @data_line_graph = [[Time.now, weather_x_days_ago_hash(0)["cloudCover"]],
      [Time.now+1.day, weather_x_days_ago_hash(-1)["cloudCover"]],
      [Time.now+2.day, weather_x_days_ago_hash(-2)["cloudCover"]],
      [Time.now+3.day, weather_x_days_ago_hash(-3)["cloudCover"]],
      [Time.now+4.day, weather_x_days_ago_hash(-4)["cloudCover"]],
      [Time.now+5.day, weather_x_days_ago_hash(-5)["cloudCover"]],
      [Time.now+6.day, weather_x_days_ago_hash(-6)["cloudCover"]],
      [Time.now+7.day, weather_x_days_ago_hash(-7)["cloudCover"]],
      ]
    end
  end

  private

  def confirm_current_user
    unless (@user.id == current_user.id) || (current_user.admin == true)
      raise AccessDenied
    end
  end

end
