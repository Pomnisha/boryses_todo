class Tasklist < ActiveRecord::Base
  belongs_to :project
  has_many :tasks, :dependent => :destroy
  validates :project_id, :tlname, :tldescription, :presence => true
end
