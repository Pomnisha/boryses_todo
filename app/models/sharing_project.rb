class SharingProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :user_id, :project_id, :presence => true
  delegate :email, :to => :user, :prefix => :user, :allow_nil => true
end
