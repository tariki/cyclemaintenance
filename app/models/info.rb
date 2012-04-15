class Info < ActiveRecord::Base
  attr_accessible :title, :content

  validates_presence_of :title, :content

  default_scope :order => 'created_at DESC'
end
