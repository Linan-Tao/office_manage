class OutStoragesController < ApplicationController
  before_action :set_out_storage, only: [:show, :edit, :update, :destroy]

  # GET /out_storages
  # GET /out_storages.json
  def index
    @out_storages = OutStorage.all
  end

  # GET /out_storages/1
  # GET /out_storages/1.json
  def show
  end

  # GET /out_storages/new
  def new
    @out_storage = OutStorage.new
  end

  # GET /out_storages/1/edit
  def edit
  end

  # POST /out_storages
  # POST /out_storages.json
  def create
    @out_storage = OutStorage.new(out_storage_params)

    respond_to do |format|
      if @out_storage.save
        format.html { redirect_to @out_storage, notice: 'Out storage was successfully created.' }
        format.json { render :show, status: :created, location: @out_storage }
      else
        format.html { render :new }
        format.json { render json: @out_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /out_storages/1
  # PATCH/PUT /out_storages/1.json
  def update
    respond_to do |format|
      if @out_storage.update(out_storage_params)
        format.html { redirect_to @out_storage, notice: 'Out storage was successfully updated.' }
        format.json { render :show, status: :ok, location: @out_storage }
      else
        format.html { render :edit }
        format.json { render json: @out_storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /out_storages/1
  # DELETE /out_storages/1.json
  def destroy
    @out_storage.destroy
    respond_to do |format|
      format.html { redirect_to out_storages_url, notice: 'Out storage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_out_storage
      @out_storage = OutStorage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def out_storage_params
      params.require(:out_storage).permit(:out_date, :department_id, :out_user, :produce_task_id, :item_id, :item_type, :number, :user_id)
    end
end
