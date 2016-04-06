class LogisticProvidersController < ApplicationController
  before_action :set_logistic_provider, only: [:show, :edit, :update, :destroy]

  # GET /logistic_providers
  # GET /logistic_providers.json
  def index
    @logistic_providers = LogisticProvider.all
  end

  # GET /logistic_providers/1
  # GET /logistic_providers/1.json
  def show
  end

  # GET /logistic_providers/new
  def new
    @logistic_provider = LogisticProvider.new
  end

  # GET /logistic_providers/1/edit
  def edit
  end

  # POST /logistic_providers
  # POST /logistic_providers.json
  def create
    @logistic_provider = LogisticProvider.new(logistic_provider_params)

    respond_to do |format|
      if @logistic_provider.save
        format.html { redirect_to @logistic_provider, notice: '物流商创建成功！' }
        format.json { render :show, status: :created, location: @logistic_provider }
      else
        format.html { render :new }
        format.json { render json: @logistic_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logistic_providers/1
  # PATCH/PUT /logistic_providers/1.json
  def update
    respond_to do |format|
      if @logistic_provider.update(logistic_provider_params)
        format.html { redirect_to @logistic_provider, notice: '物流商更新成功！' }
        format.json { render :show, status: :ok, location: @logistic_provider }
      else
        format.html { render :edit }
        format.json { render json: @logistic_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logistic_providers/1
  # DELETE /logistic_providers/1.json
  def destroy
    @logistic_provider.destroy
    respond_to do |format|
      format.html { redirect_to logistic_providers_url, notice: '物流商已删除' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logistic_provider
      @logistic_provider = LogisticProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logistic_provider_params
      params.require(:logistic_provider).permit(:name, :phone, :address, :qq, :director, :director_phone, :delivery_way,
                                                                             :arrival_cycle, :serve_rank, :price_rank, :secure_rank, :credit_rank)
    end
end
