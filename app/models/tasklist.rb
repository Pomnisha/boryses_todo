class Tasklist < ActiveRecord::Base
  belongs_to :project
  has_many :tasks
  accepts_nested_attributes_for :tasks
  validates :project_id, :tlname, :tldescription, :presence => true
end
