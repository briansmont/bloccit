class User < ActiveRecord::Base
  before_save  { self.email = email.downcase if email.present? }
  before_save :cleanup_name
  
  
  
  validates :name, length: {minimum: 1, maximum: 100 }, presence: true
  validates :password, length: {minimum: 6}, presence: true, if: "password_digest.nil?"
  validates :password, length: {minimum: 6}, allow_blank: true
  validates :email, length: {minimum: 3, maximum: 254}, presence: true, uniqueness: {case_sensitiveness: false}
  
  has_secure_password
  
  def cleanup_name
    if !name.nil?
      name_array = []
      name.split.each do |name_seg|
        name_array << name_seg.capitalize
      end
      self.name = name_array.join(" ")
    end
  end
end
