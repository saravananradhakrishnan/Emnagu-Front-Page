class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, request_keys: [:subdomain]


  after_create :auto_create_subdomain
  # after_create :send_admin_mails
  has_many :posts
  has_many :comments
  validates_uniqueness_of :username
  validates_presence_of :username, :email
  validates :password, :presence => true, :on => :create
   

  def self.find_for_authentication(warden_conditions)
    where(:email => warden_conditions[:email], :subdomain => warden_conditions[:subdomain]).first
  end

  def auto_create_subdomain
    self.subdomain = self.username
    self.save!
  end

  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end

end
