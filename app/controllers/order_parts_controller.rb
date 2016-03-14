class OrderPartsController < ApplicationController
  before_action :set_order_part, only: [:show, :edit, :update, :destroy]

  # GET /order_parts
  # GET /order_parts.json
  def index
    @order_parts = OrderPart.all
  end

  # GET /order_parts/1
  # GET /order_parts/1.json
  def show
  end

  # GET /order_parts/new
  def new
    @order_part = OrderPart.new
  end

  # GET /order_parts/1/edit
  def edit
  end

  # POST /order_parts
  # POST /order_parts.json
  def create
    @order_part = OrderPart.new(order_part_params)

    respond_to do |format|
      if @order_part.save
        format.html { redirect_to @order_part, notice: 'Order part was successfully created.' }
        format.json { render :show, status: :created, location: @order_part }
      else
        format.html { render :new }
        format.json { render json: @order_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_parts/1
  # PATCH/PUT /order_parts/1.json
  def update
    respond_to do |format|
      if @order_part.update(order_part_params)
        format.html { redirect_to @order_part, notice: 'Order part was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_part }
      else
        format.html { render :edit }
        format.json { render json: @order_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_parts/1
  # DELETE /order_parts/1.json
  def destroy
    @order_part.destroy
    respond_to do |format|
      format.html { redirect_to order_parts_url, notice: 'Order part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_part
      @order_part = OrderPart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_part_params
      params.fetch(:order_part, {})
    end
end
