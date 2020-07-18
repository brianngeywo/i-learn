class User < ActiveRecord::Base
  validates :name, presence: true
  validates :id_number, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  private
end
