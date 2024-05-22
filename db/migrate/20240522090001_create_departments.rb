class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false

      t.timestamps
    end
    # Add a foreign key to the users table
    add_reference :departments, :manager, foreign_key: { to_table: :users }
    
  end
end
