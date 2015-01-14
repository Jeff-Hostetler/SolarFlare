require 'rails_helper'

describe Forecaster do

  describe '#get_forecast' do

    let(:api_data) do
      # {
      #   "latitude"=>39.991166,
      #   "longitude"=>-105.245321,
      #   "timezone"=>"America/Denver",
      #   "offset"=>-7,
      #   {
      #     "data"=> [
      #       {
      #         "time"=>1421132400,
      #         "summary"=>"Light snow (under 1 in.) in the morning and afternoon.",
      #         "icon"=>"snow",
      #         "sunriseTime"=>1421158973,
      #         "sunsetTime"=>1421193513,
      #         "moonPhase"=>0.76,
      #         "precipIntensity"=>0.0018,
      #         "precipIntensityMax"=>0.0047,
      #         "precipIntensityMaxTime"=>1421161200,
      #         "precipProbability"=>0.46,
      #         "precipType"=>"snow",
      #         "precipAccumulation"=>0.498,
      #         "temperatureMin"=>20.86,
      #         "temperatureMinTime"=>1421132400,
      #         "temperatureMax"=>31.93,
      #         "temperatureMaxTime"=>1421182800,
      #         "apparentTemperatureMin"=>20.86,
      #         "apparentTemperatureMinTime"=>1421132400,
      #         "apparentTemperatureMax"=>31.93,
      #         "apparentTemperatureMaxTime"=>1421182800,
      #         "dewPoint"=>23.36,
      #         "humidity"=>0.91,
      #         "windSpeed"=>1.55,
      #         "windBearing"=>17,
      #         "visibility"=>5.48,
      #         "cloudCover"=>0.85,
      #         "pressure"=>1025.46,
      #         "ozone"=>307.75
      #       }
      #     ]
      #   }
      # }
      {foo: :bar}
    end

    # it 'calls ForecastIO and returns a subset of the data' do
    #   expect(ForecastIO).to receive(:forecast){ api_data }
    #
    #   f = Forecaster.new(user, Time.current)
    #   f.get_forecast
    #
    #   expect(f.data).to eq(
    #
    #   )
    #
    # end
  end
end
