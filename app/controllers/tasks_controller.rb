class TasksController < ApplicationController
  def show
    @task = Task.lookup(params[:id], true)

    respond_to do |format|
      format.html do
        unless @task
          redirect_to new_task_url(:task => {:name => params[:id].gsub(/-|_/, ' ')})
        end
      end
      format.xml do
        if @task
          render :xml => @task
        else
          render :text => '', :status => 404
        end
      end
    end
  end

  def new
    @task = Task.new(params[:task])
    @task.webcode ||= 'secret'
  end

  def create
    @task = Task.new(params[:task])
    @task.save

    respond_to do |format|
      format.html do
        if @task.new_record?
          flash[:error] = "Unable to save task"
          render :action => 'new'
        else
          redirect_to "/#{@task.slug}"
        end
      end

      format.xml do
        if @task.new_record?
          render :xml => @task.errors, :status => :unprocessable_entity
        else
          render :sml => @task
        end
      end
    end
  end

  def update
    @task = Task.lookup(params[:id])
    @task.update_attributes(params[:task])

    respond_to do |format|
      format.html do
        render :action => 'show'
      end
      format.xml do
        render :xml => @task
      end
    end
  end
end
