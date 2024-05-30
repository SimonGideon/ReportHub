Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    group :configuration, priority: :last do
      item :users, icon: "fas fa-users"
    end
  end

  table do
    # number the user without depending on id
    column :avatar, header: false do |user|
      avatar_for(user)
    end

    # number the users
    # show full name but loads first name upon click to soart it sort acordingly
    column :full_name, header: "Name", sort: :first_name
    column :email, link: true
    column :phone_number
    column :role, ->(user) { role_badge(user) }
    column :department.name, through: :department    
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |user|
    text_field :email, placeholder: "Email"
    text_field :phone_number, append: icon("phone"), placeholder: "Phone number"

    row do
      col(sm: 6) { text_field :first_name, placeholder: "First name"}
      col(sm: 6) { text_field :last_name,   placeholder: "Last name"}
    end

    row do
      col(sm: 6) { select :role, User.roles.keys }
      col(sm: 6) { select :department_id, Department.all }
    end
    

    row do
      col(sm: 6) { password_field :password, placeholder: "Password"}
      col(sm: 6) { password_field :password_confirmation, placeholder: "Password confirmation"}
    end
  end

  # Ignore the password parameters if they are blank
  update_instance do |instance, attrs|
    if attrs[:password].blank?
      attrs.delete(:password)
      attrs.delete(:password_confirmation) if attrs[:password_confirmation].blank?
    end

    instance.assign_attributes(attrs)
  end

  # Log the current user back in if their password was changed
  after_action on: :update do
    if instance == current_user && instance.encrypted_password_previously_changed?
      login!(instance)
    end
  end if Devise.sign_in_after_reset_password
end
