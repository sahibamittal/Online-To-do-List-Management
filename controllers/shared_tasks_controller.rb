class SharedTasksController < ApplicationController
  before_action :set_shared_task, only: [:show, :edit, :update, :destroy]

  # GET /shared_tasks
  # GET /shared_tasks.json
  def index
    @shared_tasks = SharedTask.all
  end

  # GET /shared_tasks/1
  # GET /shared_tasks/1.json
  def show
  end

  # GET /shared_tasks/new
  def new
    @shared_task = SharedTask.new
  end

  # GET /shared_tasks/1/edit
  def edit
  end

  # POST /shared_tasks
  # POST /shared_tasks.json
  def create
    @shared_task = SharedTask.new(shared_task_params)

    respond_to do |format|
      if @shared_task.save
        format.html { redirect_to @shared_task, notice: 'Shared task was successfully created.' }
        format.json { render :show, status: :created, location: @shared_task }
      else
        format.html { render :new }
        format.json { render json: @shared_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shared_tasks/1
  # PATCH/PUT /shared_tasks/1.json
  def update
    respond_to do |format|
      if @shared_task.update(shared_task_params)
        format.html { redirect_to @shared_task, notice: 'Shared task was successfully updated.' }
        format.json { render :show, status: :ok, location: @shared_task }
      else
        format.html { render :edit }
        format.json { render json: @shared_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_tasks/1
  # DELETE /shared_tasks/1.json
  def destroy
    @shared_task.destroy
    respond_to do |format|
      format.html { redirect_to shared_tasks_url, notice: 'Shared task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_task
      @shared_task = SharedTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shared_task_params
      params.require(:shared_task).permit(:name, :description, :priority)
    end
end
