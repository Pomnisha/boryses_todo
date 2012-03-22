class Task < ActiveRecord::Base
  belongs_to :tasklist
  belongs_to :user
  belongs_to :project
  TASK_STATES = %w(open processing done)
  TASK_PRIORITIES = %w(urgent routine)
  validates_inclusion_of :tstate, :in => Task::TASK_STATES
  validates_inclusion_of :tpriority, :in => Task::TASK_PRIORITIES
  validates :tasklist_id, :tname, :tdescription, :presence => true

end
