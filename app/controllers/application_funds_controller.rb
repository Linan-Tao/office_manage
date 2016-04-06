class ApplicationFundsController < ApplicationController
  before_action :set_application_fund, only: [:show, :edit, :update, :destroy]

  # GET /application_funds
  # GET /application_funds.json
  def index
    @application_funds = ApplicationFund.all
  end

  # GET /application_funds/1
  # GET /application_funds/1.json
  def show
  end

  # GET /application_funds/new
  def new
    @application_fund = ApplicationFund.new
  end

  # GET /application_funds/1/edit
  def edit
  end

  # POST /application_funds
  # POST /application_funds.json
  def create
    @application_fund = ApplicationFund.new(application_fund_params)

    respond_to do |format|
      if @application_fund.save
        format.html { redirect_to @application_fund, notice: '资金科目创建成功！' }
        format.json { render :show, status: :created, location: @application_fund }
      else
        format.html { render :new }
        format.json { render json: @application_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_funds/1
  # PATCH/PUT /application_funds/1.json
  def update
    respond_to do |format|
      if @application_fund.update(application_fund_params)
        format.html { redirect_to @application_fund, notice: '资金科目更新成功！' }
        format.json { render :show, status: :ok, location: @application_fund }
      else
        format.html { render :edit }
        format.json { render json: @application_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_funds/1
  # DELETE /application_funds/1.json
  def destroy
    @application_fund.destroy
    respond_to do |format|
      format.html { redirect_to application_funds_url, notice: '资金科目已删除。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_fund
      @application_fund = ApplicationFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_fund_params
      params.require(:application_fund).permit(:fund_type, :name)
    end
end
