class User < ActiveRecord::Base
  has_many :projects
  has_many :sharing_projects
  accepts_nested_attributes_for :projects
  attr_accessor :password
  attr_accessible :fname, :lname, :mname, :gender, :email, :password, :password_confirmation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  USER_GENDERS = %w(male female)
  validates_inclusion_of :gender, :in => User::USER_GENDERS

  validates :fname, :presence => true,
		                :length => {:within => 1..64}

  validates :lname, :presence => true,
		                :length => {:within => 1..64}
  
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
