class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @tasks = @project.tasks

    if params[:completed]
      @tasks = @project.tasks.where(:completed => params[:completed])
    end

     if params[:order_description] == "true"
       @tasks = @project.tasks.all.order(:description)
     end

     if params[:completed] && params[:order_description] == "true"
       @tasks = @project.tasks.where(:completed => params[:completed]).order(:description)
     end

     if params[:order_due_date] == "true"
       @tasks = @project.tasks.all.order(:due_date)
     end

     if params[:completed] && params[:order_due_date] == "true"
       @tasks = @project.tasks.where(:completed => params[:completed]).order(:due_date)
     end

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"task-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def show
  end

  def new
    @task = @project.tasks.new
  end

  def edit
  end

  def create
    @task = @project.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:description, :completed, :due_date)
  end
end
