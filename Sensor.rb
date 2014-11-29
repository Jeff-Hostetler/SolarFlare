#! /usr/bin/env ruby
require 'serialport'
require 'pg'
require 'logger'
class Sensor


  def initialize
    @sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    @log = Logger.new('Sensor.log')

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
    @log.info "Light Level: #{message}"
    message
  end

end
# puts /\d\d\d/.match(@log)
