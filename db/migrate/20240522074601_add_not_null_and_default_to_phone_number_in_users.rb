class AddNotNullAndDefaultToPhoneNumberInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :phone_number, :string, null: true, default: ""
  end
end
