class Sensor < ActiveRecord::Base

  belongs_to :user

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
