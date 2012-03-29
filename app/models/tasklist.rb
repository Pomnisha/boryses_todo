class Tasklist < ActiveRecord::Base
  belongs_to :project
  has_many :tasks, :dependent => :destroy
  validates :project_id, :tlname, :tldescription, :presence => true

  def stat
    self.tasks.count > 0 ? (self.tasks("done").count.to_f / self.tasks.count.to_f)*100.00 : 0.0
  end

end
