class TasksController < ApplicationController
  def show
    @userid = params[:userid]
    @user = User.find_by_id(@userid)
  end

  def create
    @name = params[:name]
    @description = params[:description]
    @priority = params[:priority]
    @userid = params[:userid]
    puts "User : #{@userid}"
    if @name && @userid then @task = Task.create({:user_id => @userid, :name => @name, :description => @description, :priority => @priority})
    end
  end

  def edit
    @name = params[:name]
    @description = params[:description]
    @priority = params[:priority]
    @taskid = params[:taskid]
    @userid = params[:userid]
    puts "User : #{@userid}"
    if @name && @taskid then @task = Task.update(@taskid, :name => @name, :description => @description, :priority => @priority)
    end
  end

  def delete
    @delete_confirm = params[:delete_confirm]
    @userid = params[:userid]
    @taskid = params[:taskid]
    if @delete_confirm == "yes" then
      @deleted = Task.delete(@taskid)
    end
  end

  def share
    @userid = params[:userid]
    @taskid = params[:taskid]
    @username = params[:username]
    puts "Username : #{@username}"
    # task and other user to be linked after it is shared by the user
    @task = Task.find_by_id(@taskid)
    if @username then
      @user = User.find_by_username(@username)
      if @user then
        @userid_shared = @user.id
      end
    end

    if @userid_shared then
      @task = Task.create({:user_id => @userid_shared, :name => @task.name, :description => @task.description, :priority => @task.priority})
      @shared = true
    end

  end

end
