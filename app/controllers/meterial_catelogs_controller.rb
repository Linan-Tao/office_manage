class MeterialCatelogsController < ApplicationController
  before_action :set_meterial_catelog, only: [:show, :edit, :update, :destroy]

  # GET /meterial_catelogs
  # GET /meterial_catelogs.json
  def index
    @meterial_catelogs = MeterialCatelog.all
  end

  # GET /meterial_catelogs/1
  # GET /meterial_catelogs/1.json
  def show
  end

  # GET /meterial_catelogs/new
  def new
    @meterial_catelog = MeterialCatelog.new
  end

  # GET /meterial_catelogs/1/edit
  def edit
  end

  # POST /meterial_catelogs
  # POST /meterial_catelogs.json
  def create
    @meterial_catelog = MeterialCatelog.new(meterial_catelog_params)

    respond_to do |format|
      if @meterial_catelog.save
        format.html { redirect_to @meterial_catelog, notice: 'Meterial catelog was successfully created.' }
        format.json { render :show, status: :created, location: @meterial_catelog }
      else
        format.html { render :new }
        format.json { render json: @meterial_catelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meterial_catelogs/1
  # PATCH/PUT /meterial_catelogs/1.json
  def update
    respond_to do |format|
      if @meterial_catelog.update(meterial_catelog_params)
        format.html { redirect_to @meterial_catelog, notice: 'Meterial catelog was successfully updated.' }
        format.json { render :show, status: :ok, location: @meterial_catelog }
      else
        format.html { render :edit }
        format.json { render json: @meterial_catelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meterial_catelogs/1
  # DELETE /meterial_catelogs/1.json
  def destroy
    @meterial_catelog.destroy
    respond_to do |format|
      format.html { redirect_to meterial_catelogs_url, notice: 'Meterial catelog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meterial_catelog
      @meterial_catelog = MeterialCatelog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meterial_catelog_params
      params.require(:meterial_catelog).permit(:name)
    end
end
