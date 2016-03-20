class MixTasksController < ApplicationController
  before_action :set_mix_task, only: [:show, :edit, :update, :destroy]

  # GET /mix_tasks
  # GET /mix_tasks.json
  def index
    @mix_tasks = MixTask.all
  end

  # GET /mix_tasks/1
  # GET /mix_tasks/1.json
  def show
  end

  # GET /mix_tasks/new
  def new
    @mix_task = MixTask.new
  end

  # GET /mix_tasks/1/edit
  def edit
  end

  # POST /mix_tasks
  # POST /mix_tasks.json
  def create
    @mix_task = MixTask.new(mix_task_params)

    respond_to do |format|
      if @mix_task.save
        format.html { redirect_to @mix_task, notice: 'Mix task was successfully created.' }
        format.json { render :show, status: :created, location: @mix_task }
      else
        format.html { render :new }
        format.json { render json: @mix_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mix_tasks/1
  # PATCH/PUT /mix_tasks/1.json
  def update
    respond_to do |format|
      if @mix_task.update(mix_task_params)
        format.html { redirect_to @mix_task, notice: 'Mix task was successfully updated.' }
        format.json { render :show, status: :ok, location: @mix_task }
      else
        format.html { render :edit }
        format.json { render json: @mix_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mix_tasks/1
  # DELETE /mix_tasks/1.json
  def destroy
    @mix_task.destroy
    respond_to do |format|
      format.html { redirect_to mix_tasks_url, notice: 'Mix task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mix_task
      @mix_task = MixTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mix_task_params
      params.require(:mix_task).permit(:number, :availability, :file_path)
    end
end
