class Web::Admin::TasksController < Web::Admin::ApplicationController
  breadcrumb :index, :admin_tasks_path

  def index
    query = params[:q] || { s: 'created_at desc' }
    @q = Task.ransack(query)
    @tasks = @q.result.page(params[:page])
  end

  def new
    @task = Task.new
    breadcrumb :new, new_admin_task_path
  end

  def create
    @task = Task.new params[:task]
    if @task.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      breadcrumb :new, new_admin_task_path

      render :new
    end
  end

  def edit
    @task = Task.find params[:id]
    breadcrumb @task.name, edit_admin_task_path(@task)
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes params[:task]
      flash_success
      redirect_to action: :index
    else
      flash_error
      breadcrumb @task.name, edit_admin_task_path(@task)

      render :edit
    end
  end

  def destroy
    task = Task.find params[:id]
    task.destroy

    flash_success
    redirect_to action: :index
  end
end
