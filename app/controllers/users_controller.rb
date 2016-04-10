class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :change_role, :approved]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    #select2 serch params
    @users = @users.where("name LIKE '%#{params[:term]}%'")  if params[:term].present?
    @users = @users.where(department_id: params[:department]) if params[:department].present?
    @users = @users.where("users.name like :keyword OR users.email like :keyword", keyword: "%#{params[:q]}%") if params[:q].present?
    @users = @users.order("updated_at DESC").page(params[:page])
    respond_to do |format|
       format.html
       format.json { render json: {:users => @users.select(:id, :name), :total => @users.size} }
     end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: '注册成功！' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: '修改成功！' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '用户已删除。' }
      format.json { head :no_content }
    end
  end


  def approved
    @user.approved = true
    @user.save!
    redirect_to users_path, notice: '激活成功！' 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:department_id, :gender, :status, :name, :role_ids => [])
    end
end
