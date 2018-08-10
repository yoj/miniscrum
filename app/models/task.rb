class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  STATUS_OPTIONS = {1 => "未着手", 2 => "処理中", 3 => "レビュー中", 4 => "完了"}
  PRIORITY_OPTIONS = {1 => "緊急", 2 => "高", 3 => "中", 4 => "低"}
end
