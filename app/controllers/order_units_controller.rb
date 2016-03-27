class OrderUnitsController < ApplicationController
  before_action :set_order_unit, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:import, :index,:show, :edit, :update, :destroy]
  include OrdersHelper
  # GET /order_units
  # GET /order_units.json
  def index
    @order_units = OrderUnit.all
  end

  # GET /order_units/1
  # GET /order_units/1.json
  def show
  end

  # GET /order_units/new
  def new
    @order_unit = OrderUnit.new
  end

  # GET /order_units/1/edit
  def edit
  end

  # POST /order_units
  # POST /order_units.json
  def create
    @order_unit = OrderUnit.new(order_unit_params)

    respond_to do |format|
      if @order_unit.save
        format.html { redirect_to @order_unit, notice: 'Order unit was successfully created.' }
        format.json { render :show, status: :created, location: @order_unit }
      else
        format.html { render :new }
        format.json { render json: @order_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_units/1
  # PATCH/PUT /order_units/1.json
  def update
    respond_to do |format|
      if @order_unit.update(order_unit_params)
        format.html { redirect_to @order_unit, notice: 'Order unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_unit }
      else
        format.html { render :edit }
        format.json { render json: @order_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # 导入文件，或手工输入
  def import
    if params[:file] && params[:file].original_filename !~ /.csv$/
      return redirect_to order_path(@order), notice: '文件格式不正确！'
      return_message = import_order_units(params[:file], @order.order_code)
    elsif params[:unit]
      params[:unit].each_pair do |key,value|
        next unless value.present?
        order_unit = @order.order_units.find_or_create_by(unit_id: key)
        order_unit.number = value if value.present?
        order_unit.save!
      end
      return_message = '配件添加成功！'
    else
      return_message = '配件添加失败！'
    end
    redirect_to order_path(@order), notice: return_message
  end

  # DELETE /order_units/1
  # DELETE /order_units/1.json
  def destroy
    @order_unit.destroy
    respond_to do |format|
      format.html { redirect_to order_units_url, notice: 'Order unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_unit
      @order_unit = OrderUnit.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_unit_params
      params.fetch(:order_unit, {})
    end
end
