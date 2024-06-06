class User < ApplicationRecord
  belongs_to :department
  enum role: { employee: 1, manager: 2}
  has_many :managed_departments, class_name: 'Department', foreign_key: 'manager_id', dependent: :nullify

  validates :first_name, :last_name, :email, :phone_number, :role, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :set_password

  def set_password
    self.password = phone_number if encrypted_password.blank?
  end

  def password_required?
    new_record? ? false : super
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # Users that are not managers
  def self.available_managers
    where(role: :employee)
  end
    
end
