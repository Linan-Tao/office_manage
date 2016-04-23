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

    User.find_or_create_by!(email: '969698174@qq.com') do |user|
      user.name = "chenbo"
      user.password = '123abc..'
      user.password_confirmation = '123abc..'
      user.approved = true
      role = Role.find_or_create_by!(name: '管理员', key: 'administrator')
      user.add_role!("administrator")
    end

    User.find_or_create_by!(email: '313413815@qq.com') do |user|
      user.name = "zhaowei"
      user.password = '123abc..'
      user.password_confirmation = '123abc..'
      user.approved = true
      role = Role.find_or_create_by!(name: '管理员', key: 'administrator')
      user.add_role!("administrator")
    end
  end
end
