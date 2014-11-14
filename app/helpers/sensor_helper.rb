module SensorHelper
  # require 'serialport'

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

  def sp
    SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
  end

  def light_level
    message = sp.gets
    message.chomp!
  end

end
