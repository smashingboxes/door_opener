class WelcomeController < ApplicationController
  def home
  end

  def open_door
    system("/home/sb/bin/arduino-serial -b 9600 -p /dev/ttyUSB0 -s ,")
    system("ffmpeg -f video4linux2 -s 320x240 -t 15 -i /dev/video0 -r 24 out.flv")
    redirect_to :action => "home"
  end
end
