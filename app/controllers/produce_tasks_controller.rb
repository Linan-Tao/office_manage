class ProduceTasksController < ApplicationController
  before_action :set_produce_task, only: [:show, :edit, :update, :destroy]

  # GET /produce_tasks
  # GET /produce_tasks.json
  def index
    @produce_tasks = ProduceTask.all
  end

  # GET /produce_tasks/1
  # GET /produce_tasks/1.json
  def show
  end

  # GET /produce_tasks/new
  def new
    @produce_task = ProduceTask.new
  end

  # GET /produce_tasks/1/edit
  def edit
  end

  # POST /produce_tasks
  # POST /produce_tasks.json
  def create
    @produce_task = ProduceTask.new(produce_task_params)

    respond_to do |format|
      if @produce_task.save
        format.html { redirect_to @produce_task, notice: 'Produce task was successfully created.' }
        format.json { render :show, status: :created, location: @produce_task }
      else
        format.html { render :new }
        format.json { render json: @produce_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produce_tasks/1
  # PATCH/PUT /produce_tasks/1.json
  def update
    respond_to do |format|
      if @produce_task.update(produce_task_params)
        format.html { redirect_to @produce_task, notice: 'Produce task was successfully updated.' }
        format.json { render :show, status: :ok, location: @produce_task }
      else
        format.html { render :edit }
        format.json { render json: @produce_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produce_tasks/1
  # DELETE /produce_tasks/1.json
  def destroy
    @produce_task.destroy
    respond_to do |format|
      format.html { redirect_to produce_tasks_url, notice: 'Produce task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produce_task
      @produce_task = ProduceTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produce_task_params
      params.fetch(:produce_task, {})
    end
end
