class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments, dependent: :destroy
end
