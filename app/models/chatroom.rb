class Chatroom < ApplicationRecord
  before_validation :chatroom_name

  has_many :messages
  belongs_to :project

  private

  def chatroom_name
    self.name = self.project.name
  end
end
