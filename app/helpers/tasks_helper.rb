module TasksHelper
  def task_completed?(task)
    params[:completed] == "false"
  end
end
