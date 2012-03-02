class Project < ActiveRecord::Base
  belongs_to  :user
  has_many :tasklists
  accepts_nested_attributes_for :tasklists
  validates :user_id, :name, :description, :presence => true


end
