class Project < ApplicationRecord
  belongs_to :user
  has_many :task
  has_many :project_user
  has_many :joinuser, through: :project_user, source: :user
end
