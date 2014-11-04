class DiscsController < ApplicationController
  # GET /discs
  # GET /discs.json
  after_filter :updateScore
  def updateScore
    discs = Disc.all
    discs.each do |d|
      total = 0
      s = 0
      num = 0 
      for i in 1..11 do 
        if s = d.send("week#{i}")
          total = total +s 
          num = num +1
        end
      end 
      if num
      d.update_attributes(score: total/num)
    end
    end
  end
  def editRow
    @discs = Disc.all
  end
  def updateRow
    discs = Disc.all
    discs.each do |d|
      d.update_attributes(params[d.id.to_s])
    end 
    redirect_to discs_path
  end
  def index
    @discs = Disc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discs }
    end
  end

  # GET /discs/1
  # GET /discs/1.json
  def show
    @disc = Disc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disc }
    end
  end

  # GET /discs/new
  # GET /discs/new.json
  def new
    @disc = Disc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disc }
    end
  end

  # GET /discs/1/edit
  def edit
    @disc = Disc.find(params[:id])
  end

  # POST /discs
  # POST /discs.json
  def create
    @disc = Disc.new(params[:disc])

    respond_to do |format|
      if @disc.save
        format.html { redirect_to @disc, notice: 'Disc was successfully created.' }
        format.json { render json: @disc, status: :created, location: @disc }
      else
        format.html { render action: "new" }
        format.json { render json: @disc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discs/1
  # PUT /discs/1.json
  def update
    @disc = Disc.find(params[:id])

    respond_to do |format|
      if @disc.update_attributes(params[:disc])
        format.html { redirect_to discs_path, notice: 'Disc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @disc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discs/1
  # DELETE /discs/1.json
  def destroy
    @disc = Disc.find(params[:id])
    @disc.destroy

    respond_to do |format|
      format.html { redirect_to discs_url }
      format.json { head :no_content }
    end
  end
end
