class OrderUnitsController < ApplicationController
  before_action :set_order_unit, only: [:show, :edit, :update, :destroy]

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_unit_params
      params.fetch(:order_unit, {})
    end
end
