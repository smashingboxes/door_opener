class WelcomeController < ApplicationController
  def home
  end

  def open_door
    system("/home/sb/bin/arduino-serial -b 9600 -p /dev/ttyUSB0 -s ,")
    redirect_to :action => "home"
  end
end
