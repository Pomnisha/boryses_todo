class Tasklist < ActiveRecord::Base
  belongs_to :project
  has_many :tasks, :dependent => :destroy
  validates :project_id, :tlname, :tldescription, :presence => true


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
