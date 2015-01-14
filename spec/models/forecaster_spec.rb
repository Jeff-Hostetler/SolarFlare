require 'rails_helper'

describe Forecaster do

  describe '#get_forecast' do

    let(:api_data) do
      {"latitude"=>39.991166,
        "longitude"=>-105.245321,
        "timezone"=>"America/Denver",
        "offset"=>-7,
        "currently"=>
        {"time"=>1421194493,
          "summary"=>"Snow",
          "icon"=>"snow",
          "precipIntensity"=>0.0194,
          "precipIntensityError"=>0.0006,
          "precipProbability"=>1,
          "precipType"=>"snow",
          "temperature"=>30.97,
          "apparentTemperature"=>27.4,
          "dewPoint"=>28.62,
          "humidity"=>0.91,
          "windSpeed"=>3.57,
          "windBearing"=>31,
          "visibility"=>5.48,
          "cloudCover"=>0.71,
          "pressure"=>1026.29,
          "ozone"=>303.5},
          "minutely"=>
          {"data"=>
            [{"time"=>1421194440,
              "precipIntensity"=>0.0192,
              "precipIntensityError"=>0.0005,
              "precipProbability"=>1,
              "precipType"=>"snow",
              "precipAccumulation"=>0.15829577915208778},
              {"time"=>1421194500,
                "precipIntensity"=>0.0194,
                "precipIntensityError"=>0.0006,
                "precipProbability"=>1,
                "precipType"=>"snow",
                "precipAccumulation"=>0.16018127719736028}]},
                "hourly"=>
                {"summary"=>"Light snow (under 1 in.) starting overnight, continuing until morning.",
                  "icon"=>"snow",
                  "data"=>
                  [{"time"=>1421132400,
                    "summary"=>"Mostly Cloudy",
                    "icon"=>"partly-cloudy-night",
                    "precipIntensity"=>0,
                    "precipProbability"=>0,
                    "temperature"=>21.03,
                    "apparentTemperature"=>21.03,
                    "dewPoint"=>19.13,
                    "humidity"=>0.92,
                    "windSpeed"=>0.29,
                    "windBearing"=>58,
                    "visibility"=>5.39,
                    "cloudCover"=>0.65,
                    "pressure"=>1026.61,
                    "ozone"=>314.38},
                    {"time"=>1421136000,
                      "summary"=>"Flurries",
                      "icon"=>"snow",
                      "precipIntensity"=>0.0016,
                      "precipProbability"=>0.11,
                      "precipType"=>"snow",
                      "precipAccumulation"=>0.02346301690447641,
                      "temperature"=>21.33,
                      "apparentTemperature"=>21.33,
                      "dewPoint"=>19.42,
                      "humidity"=>0.92,
                      "windSpeed"=>0.38,
                      "windBearing"=>291,
                      "visibility"=>5.44,
                      "cloudCover"=>0.56,
                      "pressure"=>1026.1,
                      "ozone"=>312.16},
                      {"time"=>1421139600,
                        "summary"=>"Flurries",
                        "icon"=>"snow",
                        "precipIntensity"=>0.0018,
                        "precipProbability"=>0.12,
                        "precipType"=>"snow",
                        "precipAccumulation"=>0.025622502110158523,
                        "temperature"=>21.93,
                        "apparentTemperature"=>21.93,
                        "dewPoint"=>20.15,
                        "humidity"=>0.93,
                        "windSpeed"=>0.49,
                        "windBearing"=>23,
                        "visibility"=>4.93,
                        "cloudCover"=>0.44,
                        "pressure"=>1025.54,
                        "ozone"=>309.95},
                        {"time"=>1421143200,
                          "summary"=>"Light Snow",
                          "icon"=>"snow",
                          "apparentTemperature"=>21.03,
                          "dewPoint"=>19.13,
                          "humidity"=>0.92,
                          "windSpeed"=>0.29,
                          "windBearing"=>58,
                          "visibility"=>5.39,
                          "cloudCover"=>0.65,
                          "pressure"=>1026.61,
                          "ozone"=>314.38},
                          {"time"=>1421136000,
                            "summary"=>"Flurries",
                            "icon"=>"snow",
                            "precipIntensity"=>0.0016,
                            "precipProbability"=>0.11,
                            "precipType"=>"snow",
                            "precipAccumulation"=>0.02346301690447641,
                            "temperature"=>21.33,
                            "apparentTemperature"=>21.33,
                            "dewPoint"=>19.42,
                            "humidity"=>0.92,
                            "windSpeed"=>0.38,
                            "windBearing"=>291,
                            "visibility"=>5.44,
                            "cloudCover"=>0.56,
                            "pressure"=>1026.1,
                            "ozone"=>312.16},
                            {"time"=>1421139600,
                              "summary"=>"Flurries",
                              "icon"=>"snow",
                              "precipIntensity"=>0.0018,
                              "precipProbability"=>0.12,
                              "precipType"=>"snow",
                              "precipAccumulation"=>0.025622502110158523,
                              "temperature"=>21.93,
                              "apparentTemperature"=>21.93,
                              "dewPoint"=>20.15,
                              "humidity"=>0.93,
                              "windSpeed"=>0.49,
                              "windBearing"=>23,
                              "visibility"=>4.93,
                              "cloudCover"=>0.44,
                              "pressure"=>1025.54,
                              "ozone"=>309.95},
                              {"time"=>1421143200,
                                "summary"=>"Light Snow",
                                "icon"=>"snow",
                                "precipIntensity"=>0.0022,
                                "precipProbability"=>0.13,
                                "precipType"=>"snow",
                                "precipAccumulation"=>0.03076915191697978,
                                "temperature"=>22.28,
                                "apparentTemperature"=>22.28,
                                "dewPoint"=>20.37,
                                "humidity"=>0.92,
                                "windSpeed"=>1.05,
                                "windBearing"=>16,
                                "visibility"=>5.58,
                                "cloudCover"=>0.53,
                                "pressure"=>1024.82,
                                "ozone"=>308.51},
                                {"time"=>1421146800,
                                  "summary"=>"Light Snow",
                                  "icon"=>"snow",
                                  "precipIntensity"=>0.0021,
                                  "precipProbability"=>0.11,
                                  "precipType"=>"snow",
                                  "precipAccumulation"=>0.029177278066510878,
                                  "temperature"=>22.41,
                                  "apparentTemperature"=>22.41,
                                  "dewPoint"=>20.24,
                                  "humidity"=>0.91,
                                  "windSpeed"=>1.2,
                                  "windBearing"=>3,
                                  "visibility"=>5.47,
                                  "cloudCover"=>0.71,
                                  "pressure"=>1024.2,
                                  "ozone"=>307.41},
                                  {"time"=>1421150400,
                                    "summary"=>"Light Snow",
                                    "icon"=>"snow",
                                    "precipIntensity"=>0.0029,
                                    "precipProbability"=>0.1,
                                    "precipType"=>"snow",
                                    "precipAccumulation"=>0.03923038626473248,
                                    "temperature"=>22.93,
                                    "apparentTemperature"=>22.93,
                                    "dewPoint"=>20.51,
                                    "humidity"=>0.9,
                                    "windSpeed"=>1.25,
                                    "windBearing"=>350,
                                    "visibility"=>5.53,
                                    "cloudCover"=>0.79,
                                    "pressure"=>1023.91,
                                    "ozone"=>306.44},
                                    {"time"=>1421154000,
                                      "summary"=>"Light Snow",
                                      "icon"=>"snow",
                                      "precipIntensity"=>0.0031,
                                      "precipProbability"=>0.1,
                                      "precipType"=>"snow",
                                      "precipAccumulation"=>0.04156684575192791,
                                      "temperature"=>23.1,
                                      "apparentTemperature"=>23.1,
                                      "dewPoint"=>20.86,
                                      "humidity"=>0.91,
                                      "windSpeed"=>1.23,
                                      "windBearing"=>350,
                                      "visibility"=>6.07,
                                      "cloudCover"=>0.73,
                                      "pressure"=>1024.2,
                                      "ozone"=>305.4},
                                      {"time"=>1421157600,
                                        "summary"=>"Light Snow",
                                        "icon"=>"snow",
                                        "precipIntensity"=>0.0036,
                                        "precipProbability"=>0.11,
                                        "precipType"=>"snow",
                                        "precipAccumulation"=>0.04714232117635175,
                                        "temperature"=>23.55,
                                        "apparentTemperature"=>23.55,
                                        "dewPoint"=>21.7,
                                        "humidity"=>0.93,
                                        "windSpeed"=>1.26,
                                        "windBearing"=>356,
                                        "visibility"=>5.98,
                                        "cloudCover"=>0.55,
                                        "pressure"=>1024.87,
                                        "ozone"=>304.47},
                                        {"time"=>1421161200,
                                          "summary"=>"Light Snow",
                                          "icon"=>"snow",
                                          "precipIntensity"=>0.0045,
                                          "precipProbability"=>0.13,
                                          "precipType"=>"snow",
                                          "precipAccumulation"=>0.057527198342632806,
                                          "temperature"=>24,
                                          "apparentTemperature"=>24,
                                          "dewPoint"=>22.38,
                                          "humidity"=>0.93,
                                          "windSpeed"=>1.17,
                                          "windBearing"=>357,
                                          "visibility"=>5.89,
                                          "cloudCover"=>0.47,
                                          "pressure"=>1025.05,
                                          "ozone"=>304.04},
                                          {"time"=>1421164800,
                                            "summary"=>"Flurries",
                                            "icon"=>"snow",
                                            "precipIntensity"=>0.0022,
                                            "precipProbability"=>0.06,
                                            "precipType"=>"snow",
                                            "precipAccumulation"=>0.025215548650556408,
                                            "temperature"=>25.95,
                                            "apparentTemperature"=>25.95,
                                            "dewPoint"=>23.99,
                                            "humidity"=>0.92,
                                            "windSpeed"=>1.73,
                                            "windBearing"=>4,
                                            "visibility"=>7,
                                            "cloudCover"=>0.59,
                                            "pressure"=>1024.58,
                                            "ozone"=>304.58},
                                            {"time"=>1421168400,
                                              "summary"=>"Mostly Cloudy",
                                              "icon"=>"partly-cloudy-day",
                                              "precipIntensity"=>0.0007,
                                              "precipProbability"=>0.01,
                                              "precipType"=>"snow",
                                              "precipAccumulation"=>0.0068227821412882575,
                                              "temperature"=>28.58,
                                              "apparentTemperature"=>28.58,
                                              "dewPoint"=>25.78,
                                              "humidity"=>0.89,
                                              "windSpeed"=>1.55,
                                              "windBearing"=>355,
                                              "visibility"=>7.05,
                                              "cloudCover"=>0.68,
                                              "pressure"=>1023.63,
                                              "ozone"=>305.63},
                                              {"time"=>1421172000,
                                                "summary"=>"Mostly Cloudy",
                                                "icon"=>"partly-cloudy-day",
                                                "precipIntensity"=>0,
                                                "precipProbability"=>0,
                                                "temperature"=>30.13,
                                                "apparentTemperature"=>30.13,
                                                "dewPoint"=>26.71,
                                                "humidity"=>0.87,
                                                "windSpeed"=>2.27,
                                                "windBearing"=>8,
                                                "visibility"=>7.53,
                                                "cloudCover"=>0.72,
                                                "pressure"=>1022.76,
                                                "ozone"=>306.14},
                                                {"time"=>1421175600,
                                                  "summary"=>"Mostly Cloudy",
                                                  "icon"=>"partly-cloudy-day",
                                                  "precipIntensity"=>0,
                                                  "precipProbability"=>0,
                                                  "temperature"=>31.53,
                                                  "apparentTemperature"=>28.35,
                                                  "dewPoint"=>28.14,
                                                  "humidity"=>0.87,
                                                  "windSpeed"=>3.32,
                                                  "windBearing"=>8,
                                                  "visibility"=>7.12,
                                                  "cloudCover"=>0.69,
                                                  "pressure"=>1022.42,
                                                  "ozone"=>305.53},
                                                  {"time"=>1421179200,
                                                    "summary"=>"Mostly Cloudy",
                                                    "icon"=>"partly-cloudy-day",
                                                    "precipIntensity"=>0,
                                                    "precipProbability"=>0,
                                                    "temperature"=>33.16,
                                                    "apparentTemperature"=>33.16,
                                                    "dewPoint"=>29.58,
                                                    "humidity"=>0.87,
                                                    "windSpeed"=>2.01,
                                                    "windBearing"=>35,
                                                    "visibility"=>6.84,
                                                    "cloudCover"=>0.67,
                                                    "pressure"=>1022.37,
                                                    "ozone"=>304.38},
                                                    {"time"=>1421182800,
                                                      "summary"=>"Mostly Cloudy",
                                                      "icon"=>"partly-cloudy-day",
                                                      "precipIntensity"=>0.0011,
                                                      "precipProbability"=>0.01,
                                                      "precipType"=>"snow",
                                                      "precipAccumulation"=>0.00836,
                                                      "temperature"=>34.03,
                                                      "apparentTemperature"=>34.03,
                                                      "dewPoint"=>29.52,
                                                      "humidity"=>0.83,
                                                      "windSpeed"=>1.6,
                                                      "windBearing"=>52,
                                                      "visibility"=>8.57,
                                                      "cloudCover"=>0.64,
                                                      "pressure"=>1022.73,
                                                      "ozone"=>303.5},
                                                      {"time"=>1421186400,
                                                        "summary"=>"Mostly Cloudy",
                                                        "icon"=>"partly-cloudy-day",
                                                        "precipIntensity"=>0,
                                                        "precipProbability"=>0,
                                                        "temperature"=>33.3,
                                                        "apparentTemperature"=>33.3,
                                                        "dewPoint"=>29.3,
                                                        "humidity"=>0.85,
                                                        "windSpeed"=>1.54,
                                                        "windBearing"=>57,
                                                        "visibility"=>7.71,
                                                        "cloudCover"=>0.61,
                                                        "pressure"=>1023.71,
                                                        "ozone"=>302.98},
                                                        {"time"=>1421190000,
                                                          "summary"=>"Mostly Cloudy",
                                                          "icon"=>"partly-cloudy-day",
                                                          "precipIntensity"=>0.0016,
                                                          "precipProbability"=>0.01,
                                                          "precipType"=>"snow",
                                                          "precipAccumulation"=>0.01216,
                                                          "temperature"=>32.76,
                                                          "apparentTemperature"=>29.9,
                                                          "dewPoint"=>29.68,
                                                          "humidity"=>0.88,
                                                          "windSpeed"=>3.2,
                                                          "windBearing"=>28,
                                                          "visibility"=>6.39,
                                                          "cloudCover"=>0.6,
                                                          "pressure"=>1024.97,
                                                          "ozone"=>302.71},
                                                          {"time"=>1421193600,
                                                            "summary"=>"Mostly Cloudy",
                                                            "icon"=>"partly-cloudy-night",
                                                            "precipIntensity"=>0,
                                                            "precipProbability"=>0,
                                                            "temperature"=>31.26,
                                                            "apparentTemperature"=>27.72,
                                                            "dewPoint"=>28.76,
                                                            "humidity"=>0.9,
                                                            "windSpeed"=>3.57,
                                                            "windBearing"=>31,
                                                            "visibility"=>5.49,
                                                            "cloudCover"=>0.69,
                                                            "pressure"=>1026.04,
                                                            "ozone"=>303.14},
                                                            {"time"=>1421197200,
                                                              "summary"=>"Mostly Cloudy",
                                                              "icon"=>"partly-cloudy-night",
                                                              "precipIntensity"=>0,
                                                              "precipProbability"=>0,
                                                              "temperature"=>30.11,
                                                              "apparentTemperature"=>26.44,
                                                              "dewPoint"=>28.17,
                                                              "humidity"=>0.92,
                                                              "windSpeed"=>3.55,
                                                              "windBearing"=>31,
                                                              "visibility"=>5.45,
                                                              "cloudCover"=>0.76,
                                                              "pressure"=>1027.03,
                                                              "ozone"=>304.6},
                                                              {"time"=>1421200800,
                                                                "summary"=>"Mostly Cloudy",
                                                                "icon"=>"partly-cloudy-night",
                                                                "precipIntensity"=>0,
                                                                "precipProbability"=>0,
                                                                "temperature"=>28.53,
                                                                "apparentTemperature"=>25.1,
                                                                "dewPoint"=>26.53,
                                                                "humidity"=>0.92,
                                                                "windSpeed"=>3.2,
                                                                "windBearing"=>28,
                                                                "visibility"=>5.94,
                                                                "cloudCover"=>0.9,
                                                                "pressure"=>1027.75,
                                                                "ozone"=>306.75},
                                                                {"time"=>1421204400,
                                                                  "summary"=>"Mostly Cloudy",
                                                                  "icon"=>"partly-cloudy-night",
                                                                  "precipIntensity"=>0,
                                                                  "precipProbability"=>0,
                                                                  "temperature"=>27.27,
                                                                  "apparentTemperature"=>27.27,
                                                                  "dewPoint"=>25.02,
                                                                  "humidity"=>0.91,
                                                                  "windSpeed"=>2.63,
                                                                  "windBearing"=>26,
                                                                  "visibility"=>6.43,
                                                                  "cloudCover"=>0.89,
                                                                  "pressure"=>1028.29,
                                                                  "ozone"=>309.03},
                                                                  {"time"=>1421208000,
                                                                    "summary"=>"Mostly Cloudy",
                                                                    "icon"=>"partly-cloudy-night",
                                                                    "precipIntensity"=>0,
                                                                    "precipProbability"=>0,
                                                                    "temperature"=>25.95,
                                                                    "apparentTemperature"=>25.95,
                                                                    "dewPoint"=>23.53,
                                                                    "humidity"=>0.9,
                                                                    "windSpeed"=>1.52,
                                                                    "windBearing"=>27,
                                                                    "visibility"=>6.85,
                                                                    "cloudCover"=>0.89,
                                                                    "pressure"=>1028.74,
                                                                    "ozone"=>311.41},
                                                                    {"time"=>1421211600,
                                                                      "summary"=>"Mostly Cloudy",
                                                                      "icon"=>"partly-cloudy-night",
                                                                      "precipIntensity"=>0,
                                                                      "precipProbability"=>0,
                                                                      "temperature"=>24.69,
                                                                      "apparentTemperature"=>24.69,
                                                                      "dewPoint"=>22.11,
                                                                      "humidity"=>0.9,
                                                                      "windSpeed"=>0.27,
                                                                      "windBearing"=>65,
                                                                      "visibility"=>7.03,
                                                                      "cloudCover"=>0.91,
                                                                      "pressure"=>1029.1,
                                                                      "ozone"=>313.92},
                                                                      {"time"=>1421215200,
                                                                        "summary"=>"Mostly Cloudy",
                                                                        "icon"=>"partly-cloudy-night",
                                                                        "precipIntensity"=>0,
                                                                        "precipProbability"=>0,
                                                                        "temperature"=>23.73,
                                                                        "apparentTemperature"=>23.73,
                                                                        "dewPoint"=>21.01,
                                                                        "humidity"=>0.89,
                                                                        "windSpeed"=>0.8,
                                                                        "windBearing"=>206,
                                                                        "visibility"=>8.27,
                                                                        "cloudCover"=>0.86,
                                                                        "pressure"=>1029.44,
                                                                        "ozone"=>316.03}]},
                                                                        "daily"=>
                                                                        {"data"=>
                                                                          [{"time"=>1421132400,
                                                                            "summary"=>"Light snow (under 1 in.) in the morning.",
                                                                            "icon"=>"snow",
                                                                            "sunriseTime"=>1421158973,
                                                                            "sunsetTime"=>1421193513,
                                                                            "moonPhase"=>0.76,
                                                                            "precipIntensity"=>0.0015,
                                                                            "precipIntensityMax"=>0.0045,
                                                                            "precipIntensityMaxTime"=>1421161200,
                                                                            "precipProbability"=>0.45,
                                                                            "precipType"=>"snow",
                                                                            "precipAccumulation"=>0.429,
                                                                            "temperatureMin"=>21.03,
                                                                            "temperatureMinTime"=>1421132400,
                                                                            "temperatureMax"=>34.03,
                                                                            "temperatureMaxTime"=>1421182800,
                                                                            "apparentTemperatureMin"=>21.03,
                                                                            "apparentTemperatureMinTime"=>1421132400,
                                                                            "apparentTemperatureMax"=>34.03,
                                                                            "apparentTemperatureMaxTime"=>1421182800,
                                                                            "dewPoint"=>24.28,
                                                                            "humidity"=>0.9,
                                                                            "windSpeed"=>1.55,
                                                                            "windBearing"=>20,
                                                                            "visibility"=>6.42,
                                                                            "cloudCover"=>0.69,
                                                                            "pressure"=>1025.37,
                                                                            "ozone"=>307.21}]},
                                                                            "flags"=>
                                                                            {"sources"=>["nwspa", "isd", "fnmoc", "rtma", "cmc", "gfs", "sref", "rap", "nam", "madis", "lamp", "darksky"],
                                                                              "isd-stations"=>["724699-03065", "724699-99999", "999999-23062", "999999-93002", "999999-94075"],
                                                                              "madis-stations"=>["AP741", "C4899", "C7944", "D0417", "D5993", "E0666", "E3608", "E5937", "E6155", "KBDU", "LEWC2", "NCARF", "NCARM", "NWTC", "RFN", "SKGCO"],
                                                                              "lamp-stations"=>["KAPA", "KBJC", "KBKF", "KDEN", "KFNL"],
                                                                              "darksky-stations"=>["KFTG"],
                                                                              "units"=>"us"}}
    end

    it 'calls ForecastIO and returns a subset of the data' do
      user = create_user
      expect(ForecastIO).to receive(:forecast){ api_data }
      f = Forecaster.new(user, Time.current)
      f.get_forecast
      expect(f.data['time']).to eq(1421132400)
    end

    # it "has a cloud_cover method" do
    #   user = create_user
    #   expect(ForecastIO).to receive(:forecast){ api_data }
    #   f = Forecaster.new(user, Time.current).get_forecast
    #   f =  f.cloud_cover
    #
    #   expect(f).to eq(100)
    # end

  end
end
