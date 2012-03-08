class User < ActiveRecord::Base
  #user owns many projects
  has_many :projects, :class_name => 'Project', :foreign_key => 'user_id'
  #user is invited to many projects
  has_many :sharing_projects
  has_many :involved_into, :through => :sharing_projects, :source => :project

  attr_accessor :password
  attr_accessible :fname, :lname, :mname, :gender, :email, :password, :password_confirmation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  USER_GENDERS = %w(male female)

  validates_inclusion_of :gender, :in => User::USER_GENDERS, :allow_nil => true

  validates :fname, :length => {:within => 0..64}

  validates :lname, :length => {:within => 0..64}
  
  validates :email, :presence => true,
		                :format => {:with => email_regex},
		                :uniqueness => {:case_sensitive => false}

  validates :password,  :presence => true,
		                    :confirmation => true,
		                    :length => {:within => 6..40},
                        :on => :create

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def generate_pwd!
    self.password = self.password_confirmation = SecureRandom.base64(6)
  end

  def username
    "#{lname} #{fname}".blank?  ? email : "#{lname} #{fname}"
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
