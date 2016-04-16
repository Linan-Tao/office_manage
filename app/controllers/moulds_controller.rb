class MouldsController < ApplicationController
  before_action :set_mould, only: [:show, :edit, :update, :destroy]

  # GET /moulds
  # GET /moulds.json
  def index
    @moulds = Mould.all
  end

  # GET /moulds/1
  # GET /moulds/1.json
  def show
  end

  # GET /moulds/new
  def new
    @mould = Mould.new(code: 'MKDY' + Time.new.strftime('%y%m%d') + SecureRandom.hex(1).upcase)
  end

  # GET /moulds/1/edit
  def edit
  end

  # POST /moulds
  # POST /moulds.json
  def create
    @mould = Mould.new(mould_params)

    respond_to do |format|
      if @mould.save
        format.html { redirect_to @mould, notice: 'Mould was successfully created.' }
        format.json { render :show, status: :created, location: @mould }
      else
        format.html { render :new }
        format.json { render json: @mould.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moulds/1
  # PATCH/PUT /moulds/1.json
  def update
    respond_to do |format|
      if @mould.update(mould_params)
        format.html { redirect_to @mould, notice: 'Mould was successfully updated.' }
        format.json { render :show, status: :ok, location: @mould }
      else
        format.html { render :edit }
        format.json { render json: @mould.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moulds/1
  # DELETE /moulds/1.json
  def destroy
    @mould.destroy
    respond_to do |format|
      format.html { redirect_to moulds_url, notice: 'Mould was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mould
      @mould = Mould.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mould_params
      params.require(:mould).permit(:code, :name, :mould_category_id, :mould_num, :length,
                                              :width, :height, :stand, :layer, :move, :clothes_rail, :door, :miss_left,
                                              :miss_right, :miss_birdge, :miss_angle, :corner, :left_division,
                                              :board_back, :board_stand, :board_top, :board_foot, :note, :creator, :status)
    end
end
