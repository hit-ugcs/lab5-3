class AttensController < ApplicationController
  # GET /attens
  # GET /attens.json
  after_filter :updateScore
  def updateScore
    attens = Atten.all
    attens.each do |a|
      total = 0
      s = 0
      num = 0 
      for i in 1..11 do 
        if s = a.send("week#{i}")
          total = total +s 
          num = num +1
        end
      end  
      if num !=0
      a.update_attributes(score: total/num)
    end
    end
  end
  def editRow
    @attens = Atten.all
  end
  def updateRow
    attens = Atten.all
    attens.each do |a|
      a.update_attributes(params[a.id.to_s])
      if !ScoreUpdates.find(:first, :conditions =>["studentid= ? and fieldname = ? and tablename = 'Atten'",a.student_id,params[:id]])
        ScoreUpdates.create(studentid:a.student_id, fieldname:params[:id],tablename:"Atten")
      end
    end
    redirect_to attens_path
  end
  def index
    @attens = Atten.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attens }
    end
  end

  # GET /attens/1
  # GET /attens/1.json
  def show
    @atten = Atten.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atten }
    end
  end

  # GET /attens/new
  # GET /attens/new.json
  def new
    @atten = Atten.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atten }
    end
  end

  # GET /attens/1/edit
  def edit
    @atten = Atten.find(params[:id])
  end

  # POST /attens
  # POST /attens.json
  def create
    @atten = Atten.new(params[:atten])

    respond_to do |format|
      if @atten.save
      	   for i in 1..11 do 
      	    if @atten.send("week#{i}") != ""
      	  	@new = ScoreUpdates.create(studentid: @atten.student_id,tablename: "Atten" ,fieldname: "week#{i}")
      	    end
      	  end 
        format.html { redirect_to @atten, notice: 'Atten was successfully created.' }
        format.json { render json: @atten, status: :created, location: @atten }
      else
        format.html { render action: "new" }
        format.json { render json: @atten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attens/1
  # PUT /attens/1.json
  def update
    @atten = Atten.find(params[:id])
    for i in 1..11 do
      if params[:atten]["week#{i}"] != Atten.find(params[:id]).send("week#{i}").to_s
      	  @new = ScoreUpdates.create(studentid: @atten.student_id,tablename: "Atten",fieldname: "week#{i}")
      	end
    end
    respond_to do |format|
      if @atten.update_attributes(params[:atten])

        format.html { redirect_to attens_path, notice: 'Atten was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attens/1
  # DELETE /attens/1.json
  def destroy
    @atten = Atten.find(params[:id])
    @atten.destroy

    respond_to do |format|
      format.html { redirect_to attens_url }
      format.json { head :no_content }
    end
  end
end
