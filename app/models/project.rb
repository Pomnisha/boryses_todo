class Project < ActiveRecord::Base
  belongs_to  :user
  has_many :tasklists, :dependent => :destroy
  accepts_nested_attributes_for :tasklists
  validates :user_id, :name, :description, :presence => true


end
