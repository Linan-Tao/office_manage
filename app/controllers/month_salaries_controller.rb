class MonthSalariesController < ApplicationController
  before_action :set_month_salary, only: [:show, :edit, :update, :destroy]

  # GET /month_salaries
  # GET /month_salaries.json
  def index
    @month_salaries = MonthSalary.all
  end

  # GET /month_salaries/1
  # GET /month_salaries/1.json
  def show
  end

  # GET /month_salaries/new
  def new
    @month_salary = MonthSalary.new
  end

  # GET /month_salaries/1/edit
  def edit
  end

  # POST /month_salaries
  # POST /month_salaries.json
  def create
    @month_salary = MonthSalary.new(month_salary_params)

    respond_to do |format|
      if @month_salary.save
        format.html { redirect_to @month_salary, notice: 'Month salary was successfully created.' }
        format.json { render :show, status: :created, location: @month_salary }
      else
        format.html { render :new }
        format.json { render json: @month_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /month_salaries/1
  # PATCH/PUT /month_salaries/1.json
  def update
    respond_to do |format|
      if @month_salary.update(month_salary_params)
        format.html { redirect_to @month_salary, notice: 'Month salary was successfully updated.' }
        format.json { render :show, status: :ok, location: @month_salary }
      else
        format.html { render :edit }
        format.json { render json: @month_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /month_salaries/1
  # DELETE /month_salaries/1.json
  def destroy
    @month_salary.destroy
    respond_to do |format|
      format.html { redirect_to month_salaries_url, notice: 'Month salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month_salary
      @month_salary = MonthSalary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def month_salary_params
      params.require(:month_salary).permit(:user_id, :name, :total, :extra, :add, :cut, :bonus, :old_age_insurance, :medicare_insurance, :unemployed_insurance, :house_fund, :pre_tax, :income_tax, :actual)
    end
end
