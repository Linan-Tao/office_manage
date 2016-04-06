class ProduceTasksController < ApplicationController
  before_action :set_produce_task, only: [:show, :edit, :update, :destroy]

  # GET /produce_tasks
  # GET /produce_tasks.json
  def index
    @produce_tasks = ProduceTask.all
    @produce_tasks = @produce_tasks.joins(:order).where(orders: { order_code: params[:q] }) if params[:q].present?
  end

  # GET /produce_tasks/1
  # GET /produce_tasks/1.json
  def show
  end

  # GET /produce_tasks/new
  def new
    @produce_task = ProduceTask.new
    # 财务审核通过方可下单
    @order_units = OrderUnit.joins(:order).where("orders.work_id = ?", Work.find_by(symbol_name: "checked").id).where(state: 0)
  end

  # GET /produce_tasks/1/edit
  def edit
    item_type = @produce_task.item_type
    if  item_type == "Material"
    @material_category_id = @produce_task.item.material_category_id
    @material_type_id = @produce_task.item.material_type_id
    elsif item_type == "Part"
      # 干啥
      @part_id = @produce_task.item_id
    end
  end

  # POST /produce_tasks
  # POST /produce_tasks.json
  def create
    # @produce_task = ProduceTask.new(produce_task_params)
    # @order = Order.find(params[:order_id])
    if params[:units].nil? || params[:units][:id].empty?
      return redirect_to new_produce_task_path(order_id: @order.id), notice: "创建失败，请选择部件!"
    end
    order_units = OrderUnit.where(id: params[:units][:id])
    material = Material.find_by(material_category_id: params[:material_category_id], material_type_id: params[:material_type_id])
    if material.blank?
      return  redirect_to new_produce_task_path(), notice: '创建失败，没有该种物料'
    end
    produce_task = ProduceTask.new(item_id: material.id, item_type: material.class)
    produce_task.area = params[:area].to_f
    produce_task.number = params[:number].to_i
    produce_task.work_id = 6
    produce_task.save!

    order_units.each do |unit|
      unit.state = 1
      unit.produce_task_id = produce_task.id
      unit.save!
    end

    if OrderUnit.joins(:order).where("orders.work_id = ?", Work.find_by(symbol_name: "checked").id).where(state: 0).any?
      redirect_to new_produce_task_path(), notice: '生产任务创建成功！'
    else
      create_part_produce_tasks
      # 下单成功
      Order.checked.each do |ord|
        if ord.order_units.where(state: 0).empty? && ord.order_parts.where(state: 0).empty?
          ord.open!
        end
      end
      redirect_to produce_tasks_path, notice: "所有订单的生产任务单创建完成，采购单已经生成。"
    end
  end

  # PATCH/PUT /produce_tasks/1
  # PATCH/PUT /produce_tasks/1.json
  def update
    respond_to do |format|
      if @produce_task.update(produce_task_params)
        format.html { redirect_to @produce_task, notice: '生产任务更新成功！' }
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
    OrderUnit.where(produce_task_id: @produce_task.id).each do |ou|
      ou.produce_task_id = nil
      ou.state = 0
      ou.save!
      ou.order.checked! unless ou.order.checked?
    end

    OrderPart.where(produce_task_id: @produce_task.id).each do |op|
      op.produce_task_id = nil
      op.state = 0
      op.save!
      op.order.checked! unless op.order.checked?
    end

    @produce_task.destroy
    respond_to do |format|
      format.html { redirect_to produce_tasks_url, notice: '生产任务已删除。' }
      format.json { head :no_content }
    end
  end

  def not_open
    @orders  = Order.checked
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produce_task
      @produce_task = ProduceTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produce_task_params
      params.require(:produce_task).permit(:order_id, :material_category_id, :material_type_id, :sequence, :area, :mix_task_id, :mix_status, :availability, :work)
    end

    def create_part_produce_tasks
      OrderPart.joins(:order).where("orders.work_id = ?", Work.find_by(symbol_name: "checked").id).where(state: 0).each do |order_part|
        produce_task = ProduceTask.new(item_id: order_part.part.id, item_type: order_part.part.class)
        produce_task.number = order_part.number.to_i
        produce_task.work_id = 6
        produce_task.save!
        order_part.state = 1
        order_part.produce_task_id = produce_task.id
        order_part.save!
      end
    end
end
