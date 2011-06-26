class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable, 
         :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation

  has_many :bikes, :dependent => :destroy

  validates_presence_of :username
  validates_length_of :username, :maximum => 64

  default_scope :order => 'users.username ASC'

end
