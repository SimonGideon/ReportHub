class Department < ApplicationRecord
    has_many :users
    belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', optional: true
  
    validates :name, presence: true, uniqueness: true

    after_save :set_manager_role
  
    def manager_name
      manager&.full_name
    end  



    private
  
    # Set manager role once allocated to a department
    def set_manager_role
      return unless manager.present? && manager.role != 'manager'
  
      manager.manager!
    rescue StandardError => e
      Rails.logger.error "Error setting manager role: #{e.message}"
    end
  end
  