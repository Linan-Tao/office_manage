class OrderBillsController < ApplicationController
  before_action :set_order_bill, only: [:show, :edit, :update, :destroy]

  # GET /order_bills
  # GET /order_bills.json
  def index
    @order_bills = OrderBill.all
    @order_bills = @order_bills.joins(:order).where(orders: { order_code: params[:q] }) if params[:q].present?
  end

  # GET /order_bills/1
  # GET /order_bills/1.json
  def show
  end

  # GET /order_bills/new
  def new
    @order_bill = OrderBill.new
  end

  # GET /order_bills/1/edit
  def edit
  end

  # POST /order_bills
  # POST /order_bills.json
  def create
    @order_bill = OrderBill.new(order_bill_params)

    respond_to do |format|
      if @order_bill.save
        format.html { redirect_to @order_bill, notice: 'Order bill was successfully created.' }
        format.json { render :show, status: :created, location: @order_bill }
      else
        format.html { render :new }
        format.json { render json: @order_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_bills/1
  # PATCH/PUT /order_bills/1.json
  def update
    respond_to do |format|
      if @order_bill.update(order_bill_params)
        format.html { redirect_to @order_bill, notice: 'Order bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_bill }
      else
        format.html { render :edit }
        format.json { render json: @order_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_bills/1
  # DELETE /order_bills/1.json
  def destroy
    @order_bill.destroy
    respond_to do |format|
      format.html { redirect_to order_bills_url, notice: 'Order bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_bill
      @order_bill = OrderBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_bill_params
      params.require(:order_bill).permit(:order_id, :total, :paid, :left, :pay_date, :pay_account, :directive, :user_id, :delivery_date)
    end
end
