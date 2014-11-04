class FinalsController < ApplicationController
  # GET /finals
  # GET /finals.json
  def editRow
    @finals = Final.all
  end
  def updateRow
    finals = Final.all
    finals.each do |f|
      f.update_attributes(params[f.id.to_s])
    end
    redirect_to finals_path
  end
  def index
    @finals = Final.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finals }
    end
  end

  # GET /finals/1
  # GET /finals/1.json
  def show
    @final = Final.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @final }
    end
  end

  # GET /finals/new
  # GET /finals/new.json
  def new
    @final = Final.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @final }
    end
  end

  # GET /finals/1/edit
  def edit
    @final = Final.find(params[:id])
  end

  # POST /finals
  # POST /finals.json
  def create
    @final = Final.new(params[:final])

    respond_to do |format|
      if @final.save
        format.html { redirect_to @final, notice: 'Final was successfully created.' }
        format.json { render json: @final, status: :created, location: @final }
      else
        format.html { render action: "new" }
        format.json { render json: @final.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finals/1
  # PUT /finals/1.json
  def update
    @final = Final.find(params[:id])

    respond_to do |format|
      if @final.update_attributes(params[:final])
        format.html { redirect_to finals_path, notice: 'Final was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @final.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finals/1
  # DELETE /finals/1.json
  def destroy
    @final = Final.find(params[:id])
    @final.destroy

    respond_to do |format|
      format.html { redirect_to finals_url }
      format.json { head :no_content }
    end
  end
end
