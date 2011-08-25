require 'rubygems'
require 'hornetseye_rmagick'
require 'hornetseye_v4l2'
require 'hornetseye_xorg'
include Hornetseye
camera = V4L2Input.new
X11Display.show { camera.read }

img = MultiArray.new( UBYTERGB, 640, 480 ) { camera.read }
img.save_ubytergb '/tmp/test.png'
