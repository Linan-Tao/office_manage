class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
    	user.name = Rails.application.secrets.admin_name
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.approved = true
      role = Role.find_or_create_by!(name: '管理员', key: 'administrator')
      user.add_role!("administrator")
    end
  end
end
