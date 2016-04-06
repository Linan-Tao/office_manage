class ProducesController < ApplicationController
  before_action :set_produce, only: [:show, :edit, :update, :destroy]

  # GET /produces
  # GET /produces.json
  def index
    @produces = Produce.all
    # 生产任务按工序分类
    @produce_tasks = ProduceTask.joins(:work).where("works.sequence in (9, 10, 11, 12, 13, 14)").order(:work_id).group_by(&:work_id)
  end

  # GET /produces/1
  # GET /produces/1.json
  def show
  end

  # GET /produces/new
  def new
    @produce = Produce.new
    @produce_task = ProduceTask.find(params[:produce_task_id])
    work = Work.find(@produce_task.work_id)
    next_work = work.next_seq
    @produce.produce_task_id = @produce_task.id
    @produce.start_time = @produce_task.updated_at
    @produce.end_time = Time.now()
    @produce.work_id = work.id
    @produce.save!
    @produce_task.work_id = next_work.id
    @produce_task.save!

    redirect_to produces_path, notice: '生产创建成功！'
  end

  # GET /produces/1/edit
  def edit
  end

  # POST /produces
  # POST /produces.json
  def create
    @produce = Produce.new(produce_params)

    respond_to do |format|
      if @produce.save
        format.html { redirect_to @produce, notice: '生产创建成功！' }
        format.json { render :show, status: :created, location: @produce }
      else
        format.html { render :new }
        format.json { render json: @produce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produces/1
  # PATCH/PUT /produces/1.json
  def update
    respond_to do |format|
      if @produce.update(produce_params)
        format.html { redirect_to @produce, notice: '生产更新成功！' }
        format.json { render :show, status: :ok, location: @produce }
      else
        format.html { render :edit }
        format.json { render json: @produce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produces/1
  # DELETE /produces/1.json
  def destroy
    @produce.destroy
    respond_to do |format|
      format.html { redirect_to produces_url, notice: '生产已删除。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produce
      @produce = Produce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produce_params
      params.require(:produce).permit(:produce_task_id, :start_time, :end_time, :work)
    end
end
