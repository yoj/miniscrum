class Project < ApplicationRecord
  belongs_to :user
  
  has_many :task
  
  has_many :joinuser, through: :projects_user, source: :user
end
