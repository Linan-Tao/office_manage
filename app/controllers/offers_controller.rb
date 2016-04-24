class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  include OffersHelper
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.where(order_union_id: params[:order_union_id])
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @order_union = OrderUnion.find(params[:order_union_id])
    create_offer(@order_union)
    redirect_to order_union_path(@order_union)
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: '报价单创建成功！' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: '报价单更新成功！' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: '报价单已删除。' }
      format.json { head :no_content }
    end
  end


  def export
    @order_union = OrderUnion.find(params[:order_union_id])
    respond_to do |format|
      format.html { redirect_to order_union_path(@order_union), notice: '导出成功' }
      format.json { head :no_content }
      format.csv do
        filename = "客户报价单－"+@order_union.code
        response.headers['Content-Disposition'] = 'attachment; filename="' + filename + '.csv"'
        render text: to_csv(@order_union)
      end
    end 
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:order_id)
    end

    def to_csv(order_union)
      return [] if order_union.nil?
      offers = order_union.offers
      # make excel using utf8 to open csv file
      head = 'EF BB BF'.split(' ').map{|a|a.hex.chr}.join()
      CSV.generate(head) do |csv|
        # 获取字段名称
        first_column = [ '客户单号', order_union.code, '经销商', order_union.agent.name, '批量套数', order_union.orders.map(&:number).sum(), '总价', offers.map(&:total).sum()]
        csv << first_column
        header_column = ['订单编号', '计价项目', '数量', '单价', '总价', '备注', '终端名称']
        csv << header_column
        offers.group_by(&:order_id).each_pair do |order_id, offers|
          offers.each do |offer|
            values = []
            values << offer.order.name
            values << offer.item_name
            values << offer.number
            values << offer.price
            values << offer.total
            values << offer.category
            values << offer.order.terminal
            csv << values
          end
          csv << [offers.first.order.name+"汇总", '', '', '', offers.map(&:total).sum()]
        end
      end
    end
end
