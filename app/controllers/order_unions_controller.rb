class OrderUnionsController < ApplicationController
  before_action :set_order_union, only: [:show, :edit, :update, :destroy]
  include OrdersHelper
  # GET /order_unions
  # GET /order_unions.json
  def index
    @order_unions = OrderUnion.all.order(created_at: :desc)
  end

  # GET /order_unions/1
  # GET /order_unions/1.json
  def show
    @order_offers = @order_union.offers
    @order_units = @order_union.orders.where(is_delete: false).map(&:order_units).flatten
    @part_categories = PartCategory.all
    @order_parts = @order_union.orders.where(is_delete: false).map(&:order_parts).flatten
    @material_categories = MaterialCategory.all
  end

  # GET /order_unions/new
  def new
    @order_union = OrderUnion.new
    @agent = Agent.new
  end

  # GET /order_unions/1/edit
  def edit
    @agent = @order_union.agent
  end

  # POST /order_unions
  # POST /order_unions.json
  def create
    @order_union = OrderUnion.new(order_union_params)
    @agent = Agent.new
    respond_to do |format|
      if @order_union.save
        format.html { redirect_to order_union_path(@order_union), notice: '订单创建成功！' }
        format.json { render :show, status: :created, location: @order_union }
      else
        format.html { render :new }
        format.json { render json: @order_union.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_unions/1
  # PATCH/PUT /order_unions/1.json
  def update
    @order_union = OrderUnion.find(params[:id])
    if params[:order_union][:type] == "offer"
      message = import_offers(params)
      if message == "success"
        return redirect_to order_union_path(@order_union), notice: "报价单创建成功"
      else
        return redirect_to order_union_path(@order_union), alert: message
      end
    end
    respond_to do |format|
      if @order_union.update(order_union_params)
        format.html { redirect_to @order_union, notice: '订单编辑成功！' }
        format.json { render :show, status: :ok, location: @order_union }
      else
        format.html { render :edit }
        format.json { render json: @order_union.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_unions/1
  # DELETE /order_unions/1.json
  def destroy
    @order_union.destroy
    respond_to do |format|
      format.html { redirect_to order_unions_url, notice: '订单已删除。' }
      format.json { head :no_content }
    end
  end

  def open
    @order_union = OrderUnion.find(params[:id])
    @order_union.checked!
    @order_union.orders.each do |order|
      order.check_time = Time.now()
      order.save!
      order.checked!
    end
    redirect_to order_bills_checked_path, notice: "订单审核通过，可下单"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_union
      @order_union = OrderUnion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_union_params
      params.require(:order_union).permit(:code, :agent_id, orders_attributes: [:id, :number, :product_id, :require_time, :order_type, :file, :_destroy])
    end
end
