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

  def done
    self.tasks.where("tstate = ?", "done").count
  end

  def in_process
    self.tasks.where("tstate = ?", "processing").count
  end

  def opened
    self.tasks.where("tstate = ?", "open").count
  end
  
  def stat
    self.tasks.count > 0 ? (self.done.to_f / self.tasks.count.to_f)*100 : 0.0
  end
end
