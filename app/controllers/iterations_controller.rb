class IterationsController < ApplicationController
  # GET /iterations
  # GET /iterations.json
  after_filter  :proUpdate
  def proUpdate
    projects= Project.all
    projects.each do |p|
      @total = 0
      p.iterations do |i|
        if i.score != nil
          @total = @total +i.score
        end
      end
      p.score = @total/p.iterations.length
    end
    return
  end
  def editRow
    @students = Student.all
    c = 0
    @students.each do |s|
      if s.iterations.length >c
        c = s.iterations.length
      end
    end

    @id = params[:id]
    @student = Student.find(Project.find(@id))
    if c > @student.iterations.length
      redirect_to projects_path, notice: "Some fields of this student is not created yet" and return 
    end 
    @iterations = Project.find(@id).iterations
  end
  def updateRow
    @id = params[:id]
    @iterations = Project.find(@id).iterations
    @iterations.each do |i|
      i.update_attributes(params[i.id.to_s])
    end 
    redirect_to projects_path and return 
  end
  def editCol
    @editIte = params[:id]
    @students = Student.all
    @students.each do |s|
      if !Iteration.find(:first, :conditions => ["student_id =? and iteNum = ?", s.id ,@editIte])
        Iteration.create(:score => nil,
                                      :iteNum => @editIte,
                                      :student_id => s.id,
                                      :project_id => s.project.id)
      end 
    end 
    @iterations = Iteration.where("iteNum = ?", @editIte)
  end
  def updateCol
    @iterations =Iteration.all
    @iterations.each do |i|
      if params[i.id.to_s] != nil
        Iteration.find(i.id).update_attributes(params[i.id.to_s])
      end
    end 
    redirect_to projects_path and return 
  end

  def save
    @student = Student.all
    @student.each do |s|
      s.project.iterations.create(iteNum: params[:id],
                                                    score: params[s.id.to_s][:score], 
                                                    project_id: s.project.id,
                                                    student_id: s.id)
      end 
    redirect_to projects_path and return
  end

  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iterations }
    end
  end

  # GET /iterations/1
  # GET /iterations/1.json
  def show
    @iteration = Iteration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iteration }
    end
  end

  # GET /iterations/new
  # GET /iterations/new.json
  def new
    @students = Student.all
    @c = @students[0].iterations.length
    @students.each do |s|
      if @c != s.iterations.length
        redirect_to projects_path,
                    notice: "Someone's iterations score is not created yet"
      end
    end
  end

  # GET /iterations/1/edit
  def edit
    @iteration = Iteration.find(params[:id])
  end

  # POST /iterations
  # POST /iterations.json
  def create
    @iteration = Iteration.new(params[:iteration])

    respond_to do |format|
      if @iteration.save
        format.html { redirect_to projects_path, notice: 'Iteration was successfully created.' }
        format.json { render json: @iteration, status: :created, location: @iteration }
      else
        format.html { render action: "new" }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iterations/1
  # PUT /iterations/1.json
  def update
    @iteration = Iteration.find(params[:id])

    respond_to do |format|
      if @iteration.update_attributes(params[:iteration])
        format.html { redirect_to projects_path, notice: 'Iteration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.json
  def destroy
    @iteration = Iteration.find(params[:id])
    @iteration.destroy

    respond_to do |format|
      format.html { redirect_to iterations_url }
      format.json { head :no_content }
    end
  end
  def single
    @iteration = Iteration.create(iteNum: params[:id2],
                                                       score: nil,
                                                       student_id:params[:id1],
                                                       project_id: Student.find(params[:id1]).project.id
                                                       )

  end
end
