class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy, :checked, :check_failed]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  def not_check
    @purchases = Purchase.where(check_status: 1)
  end
  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to purchases_url, notice: '采购单创建成功！' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchases_url, notice: '采购单更新成功！' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: '采购单已删除。' }
      format.json { head :no_content }
    end
  end

  def checked
    @purchase.checked!
    # 财务审核通过以后该生产单工序为采购
    @purchase.produce_task.work_id = Work.find_by(symbol_name: "purchased").id
    @purchase.produce_task.save!
    redirect_to not_check_purchases_url, notice: '审核通过'
  end

  def check_failed
    @purchase.check_failed!
    redirect_to not_check_purchases_url, notice: "审核不通过"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:produce_task_id, :item_id, :item_type,
                                                        :number, :unit, :note, :way, :arrival_number,
                                                        :price, :payable, :actual_pay, :discount, :pay_type,
                                                        :user, :check_status)
    end
end
