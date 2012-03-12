class SharingProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  delegate :email, :to => :user, :prefix => :user, :allow_nil => true
end
