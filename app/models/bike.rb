class Bike < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'public/images/uploaded'

  attr_accessible :manufacturer, :model_name, :frame_number, :image_file

  belongs_to :user
  has_many :components, :dependent => :destroy
  has_many :records, :dependent => :destroy

  validates_presence_of :manufacturer, :model_name, :user_id
  validates_length_of :manufacturer, :maximum => 64 
  validates_length_of :model_name,   :maximum => 64
  validates_length_of :frame_number, :maximum => 64

  default_scope :order => 'bikes.created_at DESC'

end
