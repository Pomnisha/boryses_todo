class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fname, :lname, :mname, :gender, :email, :password, :password_confirmation, :remember_me
  #user owns many projects
  #has_many :projects, :class_name => 'Project', :foreign_key => 'user_id'
  #user is invited to many projects
  has_many :sharing_projects
  has_many :involved_into, :through => :sharing_projects, :source => :project
  has_many :tasks_todo, :class_name => 'Task', :foreign_key => 'user_id'


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  USER_GENDERS = %w(male female)

  validates_inclusion_of :gender, :in => User::USER_GENDERS, :allow_nil => true


  validates :email, :presence => true,
		                :format => {:with => email_regex},
		                :uniqueness => {:case_sensitive => false}

  validates :password,  :presence => true,
		                    :confirmation => true,
		                    :length => {:within => 6..40},
                        :on => :create


  def generate_pwd!
    self.password = self.password_confirmation = SecureRandom.base64(6)
  end

  def username
    "#{lname} #{mname} #{fname}".blank?  ? email : "#{lname} #{ mname[0] << "." if !mname.blank?} #{fname}"
  end

  def projects
    sharing_projects.map(&:project) | Project.where(:owner_id => id)
  end

  def tasks_todo_in_project(project)
    self.tasks_todo.where(project)
  end
  

end
