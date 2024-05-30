Trestle.resource(:departments) do
  menu do
    item :departments, icon: "fa fa-building"
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
    column :name
    column :manager, through: :manager do |department|
      department.manager&.full_name
    end
    # number of employees
    column "Employees" do |department|
      "#{department.users.count} <i class='fa fa-users'></i>".html_safe
    end
    actions 
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |department|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # limit managers to those who don't have a department assigned
  form do |department|
    text_field :name
    select :manager_id, User.available_managers, label: "Manager", include_blank: true
  end
  

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:department).permit(:name, ...)
  # end
end
