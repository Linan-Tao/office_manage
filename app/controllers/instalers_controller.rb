class InstalersController < ApplicationController
  before_action :set_instaler, only: [:show, :edit, :update, :destroy]

  # GET /instalers
  # GET /instalers.json
  def index
    @instalers = Instaler.all
  end

  # GET /instalers/1
  # GET /instalers/1.json
  def show
  end

  # GET /instalers/new
  def new
    @instaler = Instaler.new
  end

  # GET /instalers/1/edit
  def edit
  end

  # POST /instalers
  # POST /instalers.json
  def create
    @instaler = Instaler.new(instaler_params)

    respond_to do |format|
      if @instaler.save
        format.html { redirect_to @instaler, notice: '安装工人创建成功！' }
        format.json { render :show, status: :created, location: @instaler }
      else
        format.html { render :new }
        format.json { render json: @instaler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instalers/1
  # PATCH/PUT /instalers/1.json
  def update
    respond_to do |format|
      if @instaler.update(instaler_params)
        format.html { redirect_to @instaler, notice: '安装工人更新成功！' }
        format.json { render :show, status: :ok, location: @instaler }
      else
        format.html { render :edit }
        format.json { render json: @instaler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instalers/1
  # DELETE /instalers/1.json
  def destroy
    @instaler.destroy
    respond_to do |format|
      format.html { redirect_to instalers_url, notice: '安装工人已删除。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instaler
      @instaler = Instaler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instaler_params
      params.require(:instaler).permit(:name, :install_type, :phone, :tech_rank, :serve_rank, :price_rank, :secure_rank, :credit_rank)
    end
end
