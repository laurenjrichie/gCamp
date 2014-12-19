class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to project_tasks_path(@project), notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
  end

  private
  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:description, :completed, :due_date, :project_id)
  end
end
