class EventsController < ApplicationController
  before_action :find_room
  def index
    @events = Event.scoped
    @events = Event.between(params['start'], params['end']) if (params['start'] && params['end'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if check_date
      respond_to do |format|
        if @event.save
          format.html { redirect_to room_event_path(@room, @event), :notice => 'Event was successfully created.' }
          format.json { render :json => @event, :status => :created, :location => @event }
        else
          format.html { render :action => "new" }
          format.json { render :json => @event.errors, :status => :unprocessable_entity }
        end
      end
    else
      render :new
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to room_path(@room) }
      format.json { head :no_content }
    end
  end

  private 
  def event_params
    params.require(:event).permit(:titls, :starts_at, :ends_at, :all_day, :description, :user_id, :room_id)
  end

  def find_room
    @room = Room.find(params[:room_id])
  end

  def check_date
    if @room.events.where(['starts_at BETWEEN ? AND ?', @event.starts_at, @event.ends_at]).any?
      # conflict with start time
      return false
    end
    if @room.events.where(['ends_at BETWEEN ? AND ?', @event.starts_at, @event.ends_at]).any?
      # conflic with 'end' time
      return false
    end
    return true
  end

end
