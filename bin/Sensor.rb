#! /usr/bin/env ruby
require 'serialport'
require 'pg'
require 'logger'
class Sensor

  def initialize
    @sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    @log = Logger.new File.expand_path("~/log_for_SolarFlare/Sensor-#{Time.now.to_i}")
  end

  def port_str
    '/dev/tty.usbserial-DA013QVU'
  end
  def baud_rate
    9600
  end
  def data_bits
    8
  end

  def stop_bits
    1
  end

  def parity
    SerialPort::NONE
  end


  def light_level
    message = @sp.gets
    message.chomp!
    @log.info "Light Level: #{message}"
    message.to_i
  end

end


conn = PG.connect( dbname: 'SolarFlare_development' )

data = Sensor.new
loop do
  level = data.light_level
  sleep 60
  sql = 'insert into sensors (data_point, created_at) values ($1, $2);'
  conn.exec_params(sql, [level, Time.now.to_s])
end
