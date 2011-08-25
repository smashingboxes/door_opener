class OpeningsController < ApplicationController
  before_filter :must_be_logged_in, :except => [:index]
  # GET /openings
  # GET /openings.json
  def index
    @openings = Opening.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @openings }
    end
  end

  # GET /openings/1
  # GET /openings/1.json
  def show
    @opening = Opening.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @opening }
    end
  end

  # GET /openings/new
  # GET /openings/new.json
  def new
    @opening = Opening.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @opening }
    end
  end

  # GET /openings/1/edit
  def edit
    @opening = Opening.find(params[:id])
  end

  # POST /openings
  # POST /openings.json
  def create
    @opening = Opening.new(params[:opening])
    system("/home/sb/bin/arduino-serial -b 9600 -p /dev/ttyUSB0 -s ,")
    @opening.file_name = Time.now.strftime("%Y-%m-%d_%H-%M-%S-%p") + ".ogg"
    system("ffmpeg -f video4linux2 -s 320x240 -t 10 -i /dev/video0 -r 24 #{Rails.root.to_s}/app/assets/videos/#{@opening.file_name}")
    respond_to do |format|
      if @opening.save
        format.html { redirect_to @opening, notice: 'Door was successfully opened' }
        format.json { render json: @opening, status: :created, location: @opening }
      else
        format.html { render action: "new" }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /openings/1
  # PUT /openings/1.json
  def update
    @opening = Opening.find(params[:id])

    respond_to do |format|
      if @opening.update_attributes(params[:opening])
        format.html { redirect_to @opening, notice: 'Opening was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openings/1
  # DELETE /openings/1.json
  def destroy
    @opening = Opening.find(params[:id])
    @opening.destroy

    respond_to do |format|
      format.html { redirect_to openings_url }
      format.json { head :ok }
    end
  end

  protected
  def must_be_logged_in
    unless current_user
      redirect_to openings_path
    end
  end
end
