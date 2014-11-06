class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  after_filter :sumUpdate
  def sumUpdate
    students = Student.all
    students.each do |student|
    if student.project != nil && student.project.score != nil && student.final != nil && student.final.score != nil && student.lab != nil && student.lab.score != nil && student.disc != nil &&  student.disc.score != nil && student.atten != nil && student.atten.score != nil
      student.update_attributes(sum: student.project.score*0.4+student.final.score*0.4+student.lab.score*0.1+student.disc.score*0.05+student.atten.score*0.05)
      if student.sum >= 90
        student.update_attributes(grade: "A")
      end 
      if student.sum <90 and student.sum >=75
        student.update_attributes(grade: "B")
      end
      if student.sum <75 and student.sum >=60
        student.update_attributes(grade: "C")
      end
      if student.sum <60 
        student.update_attributes(grade: "D")
      end 
    end
   end
  end
  def index
    @students = Student.all
    if @students.length > 1
      @students.sort! {|a,b| b.sum <=> a.sum}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        @project = Project.create(score: nil, student_id: @student.id)
        @iteration = Iteration.create(iteNum: 1, score: nil, project_id: @project.id, student_id: @student.id )
        @lab = Lab.create(student_id: @student.id)
        @final  = Final.create(student_id: @student.id)
        @disc = Disc.create(student_id: @student.id)
        @atten = Atten.create(student_id: @student.id)
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/10
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to students_path, notice: 'close' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.project.destroy
    @updates = ScoreUpdates.where(:studentid => @student.id)
    @updates.each do |u|
      u.destroy
    end
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
