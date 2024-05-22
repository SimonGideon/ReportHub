class User < ApplicationRecord
  belongs_to :department
  enum role: { employee: 1, manager: 2 }
  has_many :managed_departments, class_name: 'Department', foreign_key: 'manager_id'

  validates :first_name, :last_name, :email, :phone_number, :role, :department_id, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_password
    self.encrypted_password = self.phone_number
  end

  before_validation :set_password, on: :create

  def password_required?
    new_record? ? false : super
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # users that are not managers
  def self.available_managers
    User.where(role: :employee)
  end
end
