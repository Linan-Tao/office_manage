class ItemStoragesController < ApplicationController
  before_action :set_item_storage, only: [:show, :edit, :update, :destroy]

  # GET /item_storages
  # GET /item_storages.json
  def index
    @item_storages = ItemStorage.all
    # 显示还没有到货完全的采购单号
    @purchases = Purchase.where(check_status: Purchase.check_statuses[:checked]).where("number > arrival_number")
  end

  # GET /item_storages/1
  # GET /item_storages/1.json
  def show
  end

  # GET /item_storages/new
  def new
    @item_storage = ItemStorage.new
    @purchase = Purchase.find(params[:purchase_id])
    @item_storage.purchase_id = @purchase.id
    @item_storage.item_id = @purchase.item_id
    @item_storage.item_type = @purchase.item_type
    @item_storage.supplier_id = @purchase.supplier_id
  end

  # GET /item_storages/1/edit
  def edit
  end

  # POST /item_storages
  # POST /item_storages.json
  def create
    @item_storage = ItemStorage.new(item_storage_params)
    @purchase = Purchase.find(params[:item_storage][:purchase_id])
    @item_storage.purchase_id = @purchase.id
    @item_storage.item_id = @purchase.item_id
    @item_storage.item_type = @purchase.item_type
    @item_storage.supplier_id = @purchase.supplier_id    
    respond_to do |format|
      if @item_storage.save
        format.html { redirect_to item_storages_url, notice: 'Item storage was successfully created.' }
        format.json { render :show, status: :created, location: @item_storage }
      else
        format.html { render :new }
        format.json { render json: @item_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_storages/1
  # PATCH/PUT /item_storages/1.json
  def update
    respond_to do |format|
      if @item_storage.update(item_storage_params)
        format.html { redirect_to item_storages_url, notice: 'Item storage was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_storage }
      else
        format.html { render :edit }
        format.json { render json: @item_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_storages/1
  # DELETE /item_storages/1.json
  def destroy
    @item_storage.destroy
    respond_to do |format|
      format.html { redirect_to item_storages_url, notice: 'Item storage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_storage
      @item_storage = ItemStorage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_storage_params
      params.require(:item_storage).permit(:storage_date, :receiver, :purchase, :item_id, :item_type, :brand, :number, :supplier_id,:purchase_id, :item_option_id, :item_category_id)
    end
end
