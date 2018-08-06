class User < ApplicationRecord
  has_secure_password
  
  has_many :project
  has_many :task
  has_many :project_user
  has_many :myproject, through: :project_user, source: :project
end
