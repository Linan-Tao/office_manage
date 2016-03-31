class DeliveryPlansController < ApplicationController
  before_action :set_delivery_plan, only: [:show, :edit, :update, :destroy]

  # GET /delivery_plans
  # GET /delivery_plans.json
  def index
    @delivery_plans = DeliveryPlan.all
  end

  # GET /delivery_plans/1
  # GET /delivery_plans/1.json
  def show
  end

  # GET /delivery_plans/new
  def new
    @delivery_plan = DeliveryPlan.new
  end

  # GET /delivery_plans/1/edit
  def edit
  end

  # POST /delivery_plans
  # POST /delivery_plans.json
  def create
    @delivery_plan = DeliveryPlan.new(delivery_plan_params)

    respond_to do |format|
      if @delivery_plan.save
        format.html { redirect_to @delivery_plan, notice: 'Delivery plan was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_plan }
      else
        format.html { render :new }
        format.json { render json: @delivery_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_plans/1
  # PATCH/PUT /delivery_plans/1.json
  def update
    respond_to do |format|
      if @delivery_plan.update(delivery_plan_params)
        format.html { redirect_to @delivery_plan, notice: 'Delivery plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_plan }
      else
        format.html { render :edit }
        format.json { render json: @delivery_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_plans/1
  # DELETE /delivery_plans/1.json
  def destroy
    @delivery_plan.destroy
    respond_to do |format|
      format.html { redirect_to delivery_plans_url, notice: 'Delivery plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_plan
      @delivery_plan = DeliveryPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_plan_params
      params.require(:delivery_plan).permit(:order_id, :produce_task_ids, :number, :fin_type, :agency_fund, :delivery_date, :specify_logistic, :logistic_provider_id, :logistic_code)
    end
end
