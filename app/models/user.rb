class User

  include DataMapper::Resource
  
  has 1, :filer

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
	       :token_authenticatable, :confirmable, :lockable, :authentication_keys => [:username]

  property :username, String, :required => true, :unique => true, :length => 255

  ## Database authenticatable
  property :email,              String, :required => true, :unique => true, :default => "", :length => 255
  property :encrypted_password, String, :required => true, :default => "", :length => 255

  ## Recoverable
  property :reset_password_token,   String
  property :reset_password_sent_at, DateTime

  ## Rememberable
  property :remember_created_at, DateTime

  ## Trackable
  property :sign_in_count,      Integer, :default => 0
  property :current_sign_in_at, DateTime
  property :last_sign_in_at,    DateTime
  property :current_sign_in_ip, String
  property :last_sign_in_ip,    String

  ## Encryptable
  property :password_salt, String

  ## Confirmable
  property :confirmation_token,   String
  property :confirmed_at,         DateTime
  property :confirmation_sent_at, DateTime
  property :unconfirmed_email,    String # Only if using reconfirmable

  ## Lockable
  property :failed_attempts, Integer, :default => 0 # Only if lock strategy is :failed_attempts
  property :unlock_token,    String # Only if unlock strategy is :email or :both
  property :locked_at,       DateTime

  ## Token authenticatable
  property :authentication_token, String, :length => 255

  ## Invitable
  property :invitation_token, String, :length => 255

  property :id, Serial

  property :created_at, DateTime
  property :updated_at, DateTime

  # see: https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-sign-in-using-their-username-or-email-address
  def self.find_first_by_auth_conditions(warden_conditions)
	conditions = warden_conditions.dup
    	if login = conditions.delete(:username)
		all(conditions).all(:conditions => ['username = ? or email = ?', login.downcase, login.downcase ]).first
    	else
		first(conditions)
    	end
  end

end
