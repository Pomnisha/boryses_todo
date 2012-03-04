class Project < ActiveRecord::Base
  belongs_to  :user
  has_many :tasklists, :dependent => :destroy
  has_many :tasks, :through => :tasklists
  has_many :sharing_projects
  has_many :users, :through => :sharing_projects

  validates :user_id, :name, :description, :presence => true

  def collaborators
    users.all << user_id
  end

end
