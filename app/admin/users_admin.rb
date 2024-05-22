Trestle.resource(:users) do
  menu do
    item :users, icon: "fa fa-user"
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # show relevant fields in the table
  table do
    column :id
    # full name is a method in the user model
    column :full_name
    column :email
    column :phone_number
    column :role
    column :department.name, through: :department
    # hide password and show upon clicking eye icon
    column "Password" do |user|
      "<span class='password-field' data-password='#{user.encrypted_password}' data-visible='false'>**********</span>
       <i class='fa fa-eye eye-icon' style='cursor: pointer; margin-left: 5px;'></i>".html_safe
    end
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |user|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end
  # only relevant fileds are shown
  form do |user|
    text_field :first_name
    text_field :last_name
    text_field :email
    text_field :phone_number
    select :role, User.roles.keys
    select :department_id, Department.all
    text_field :password
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:user).permit(:name, ...)
  # end
end

