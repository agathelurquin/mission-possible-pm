class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments
  has_one_attached :avatar

  def projects_as_contributor
    tasks.map do |task|
      task.project
    end
  end
end
