class Project < ActiveRecord::Base
  belongs_to  :owner, :class_name => "User"
  has_many :tasklists, :dependent => :destroy
  has_many :tasks, :through => :tasklists
  has_many :sharing_projects
  has_many :users, :through => :sharing_projects

  validates :owner_id, :name, :description, :presence => true

  def collaborators
    users.all << owner
  end

  def stat
    self.tasks.count > 0 ? (self.tasks.status("done").count.to_f / self.tasks.count.to_f)*100.00 : 0.0
  end
end
