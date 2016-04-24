class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  include OrdersHelper
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(is_delete: false).order(created_at: :desc)
    @orders = @orders.where("name LIKE '%#{params[:term]}%'")  if params[:term].present?
    @orders = @orders.where(work_id: params[:work_id]) if params[:work_id].present?
    respond_to do |format|
       format.html
       format.json { render json: {:orders => @orders.select(:id, :name), :total => @orders.size} }
     end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_units = @order.order_units
    @part_categories = PartCategory.all
    @order_parts = @order.order_parts
    @labor_costs = @order.labor_costs
    @material_categories = MaterialCategory.all
  end

  # GET /orders/new
  def new
    @order = Order.new(name: Time.new.strftime('%Y%m%d%H%M%S'))
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.work_id = Work.find_by(sequence: 1).id
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order), notice: '订单创建成功！' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        @order.work_id = 2 if @order.work.sequence > 2
        @order.save
        format.html { redirect_to order_path(@order), notice: '订单更新成功！' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: '订单已删除。' }
      format.json { head :no_content }
    end
  end


  def download
    order = Order.find(params[:id])
    send_file order.file.path,
                :filename => order.file_file_name,
                :type => order.file_content_type,
                :disposition => 'attachment'
    flash[:notice] = "Your file has been downloaded"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :agent_id, :order_type, :require_time, :ply, :texture, :face, :color, :terminal, :work_id,:is_delete,:file,
                                                              order_units_attributes: [:id, :unit_name, :name, :ply, :texture, :face, :color, :length, :width,
                                                              :number, :size, :edge, :note, :_destroy],
                                                              order_parts_attributes:[:id, :part_id, :number, :note, :_destroy],
                                                              labor_costs_attributes: [:id, :price, :number, :item, :_destroy])
    end
end
