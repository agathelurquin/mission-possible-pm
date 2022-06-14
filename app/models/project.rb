class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :assignments, through: :tasks
  has_one :chatroom, dependent: :destroy
  has_many_attached :files, dependent: :destroy

  validates :name, :description, :due_date, presence: true
  validates :name, uniqueness: true

  after_save :create_chatroom

  private

  def create_chatroom
    Chatroom.create! project_id: self.id
  end
end
