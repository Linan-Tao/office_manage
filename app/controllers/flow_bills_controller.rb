class FlowBillsController < ApplicationController
  before_action :set_flow_bill, only: [:show, :edit, :update, :destroy]

  # GET /flow_bills
  # GET /flow_bills.json
  def index
    @flow_bills = FlowBill.all
  end

  # GET /flow_bills/1
  # GET /flow_bills/1.json
  def show
  end

  # GET /flow_bills/new
  def new
    @flow_bill = FlowBill.new
  end

  # GET /flow_bills/1/edit
  def edit
  end

  # POST /flow_bills
  # POST /flow_bills.json
  def create
    @flow_bill = FlowBill.new(flow_bill_params)

    respond_to do |format|
      if @flow_bill.save
        format.html { redirect_to @flow_bill, notice: 'Flow bill was successfully created.' }
        format.json { render :show, status: :created, location: @flow_bill }
      else
        format.html { render :new }
        format.json { render json: @flow_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flow_bills/1
  # PATCH/PUT /flow_bills/1.json
  def update
    respond_to do |format|
      if @flow_bill.update(flow_bill_params)
        format.html { redirect_to @flow_bill, notice: 'Flow bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @flow_bill }
      else
        format.html { render :edit }
        format.json { render json: @flow_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flow_bills/1
  # DELETE /flow_bills/1.json
  def destroy
    @flow_bill.destroy
    respond_to do |format|
      format.html { redirect_to flow_bills_url, notice: 'Flow bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flow_bill
      @flow_bill = FlowBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flow_bill_params
      params.require(:flow_bill).permit(:bill_date, :customer, :total, :account, :note, :server_code, :order_code, :bill_code, :operator, :operate_date, :check_status, :check_date, :application_fund_id, :checker, :bill_type, :purchase_code)
    end
end
