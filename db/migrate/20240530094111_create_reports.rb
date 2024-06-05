class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.text :task_description
      t.decimal :quantity
      t.text :remarks
      t.text :optional_note

      t.timestamps
    end
  end
end
