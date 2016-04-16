class MouldCategoriesController < ApplicationController
  before_action :set_mould_category, only: [:show, :edit, :update, :destroy]

  # GET /mould_categories
  # GET /mould_categories.json
  def index
    @mould_categories = MouldCategory.all
  end

  # GET /mould_categories/1
  # GET /mould_categories/1.json
  def show
  end

  # GET /mould_categories/new
  def new
    @mould_category = MouldCategory.new(code: 'MKLX' + Time.new.strftime('%y%m%d') + SecureRandom.hex(1).upcase)
  end

  # GET /mould_categories/1/edit
  def edit
  end

  # POST /mould_categories
  # POST /mould_categories.json
  def create
    @mould_category = MouldCategory.new(mould_category_params)

    respond_to do |format|
      if @mould_category.save
        format.html { redirect_to @mould_category, notice: 'Mould category was successfully created.' }
        format.json { render :show, status: :created, location: @mould_category }
      else
        format.html { render :new }
        format.json { render json: @mould_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mould_categories/1
  # PATCH/PUT /mould_categories/1.json
  def update
    respond_to do |format|
      if @mould_category.update(mould_category_params)
        format.html { redirect_to @mould_category, notice: 'Mould category was successfully updated.' }
        format.json { render :show, status: :ok, location: @mould_category }
      else
        format.html { render :edit }
        format.json { render json: @mould_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mould_categories/1
  # DELETE /mould_categories/1.json
  def destroy
    @mould_category.destroy
    respond_to do |format|
      format.html { redirect_to mould_categories_url, notice: 'Mould category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mould_category
      @mould_category = MouldCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mould_category_params
      params.require(:mould_category).permit(:code, :name, :note, :creator, :status)
    end
end
