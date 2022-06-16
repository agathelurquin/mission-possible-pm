class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :assignments, through: :tasks
  has_many :users, through: :assignments
  has_one :chatroom, dependent: :destroy
  has_many_attached :files, dependent: :destroy

  validates :name, :description, :due_date, presence: true
  validates :name, uniqueness: true

  after_save :create_chatroom

  STATUS = ["Open", "In progress", "Completed", "Cancelled"]

  private

  def create_chatroom
    Chatroom.create! project_id: self.id
  end
end
