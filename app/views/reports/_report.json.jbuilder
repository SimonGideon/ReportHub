json.extract! report, :id, :user_id, :department_id, :date, :start_time, :end_time, :location, :task_description, :quantity, :remarks, :customer_feedback, :optional_note, :created_at, :updated_at
json.url report_url(report, format: :json)
