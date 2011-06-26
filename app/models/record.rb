class Record < ActiveRecord::Base
  attr_accessible :maintain_at, :content

  belongs_to :bike

  validates_presence_of :maintain_at, :content, :bike_id
  validates_length_of :content, :maximum => 140

  default_scope :order => 'created_at DESC'

end
