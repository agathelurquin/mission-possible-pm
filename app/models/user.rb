class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :assignments
  has_many :tasks, through: :assignments

  def projects_as_contributor
    tasks.map do |task|
      task.project
    end
  end
end
