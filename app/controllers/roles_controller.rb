class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save && set_roles_permissions(@role, params[:roles_permissions])
        format.html { redirect_to roles_path, notice: '角色创建成功' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    if @role.editable?
      if @role.update(role_params) && set_roles_permissions(@role, params[:roles_permissions])
        flash[:notice] = '角色修改成功！'
      end
    else
      flash[:alert] = '修改失败！'
    end
    render :edit
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    msg = if @role.editable?
            @role.destroy
            { notice: '角色已删除。' }
          else
            { alert: '删除失败！' }
          end
    redirect_to roles_url, msg
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :key)
    end

    def set_roles_permissions(role, options={})
      role.roles_permissions.destroy_all
      options.each_pair do |k, v|
        role.roles_permissions.create(klass: k, actions: v.join(','))
      end
    end
end
