class Component < ActiveRecord::Base
  attr_accessible :item, :manufacturer, :group_name, :model_name, :weight

  belongs_to :bike

  validates_presence_of :item, :manufacturer, :bike_id
  validates_length_of :item,         :maximum => 64
  validates_length_of :manufacturer, :maximum => 64
  validates_length_of :group_name,   :maximum => 64
  validates_length_of :model_name,   :maximum => 64
  validates_numericality_of :weight, :only_interger => true, :if => :weight

  default_scope :order => 'components.item ASC'

  ITEMS = ["Accessory",
           "Bottom Bracket",
           "Brake",
           "Brake Cartridge Shoe",
           "Brake Cartridge Pad",
           "Brake Lever",
           "Brake Pad",
           "Brake Cable Outer",
           "Cassette",
           "Chain",
           "Chainring",
           "Crank",
           "Crankset",
           "Fork",
           "Frame",
           "Freewheel",
           "Frond Derailleur",
           "Gear Cable Outer",
           "Inner Brake Cable",
           "Inner Gear Calbe",
           "Handlebar",
           "Headset",
           "Hub",
           "Pedal",
           "Rear Derailleur",
           "Saddle",
           "Seat Post",
           "Shifter",
           "Shifting Brake Lever",
           "Small Part",
           "Stem"]

  def self.item_select
    return ITEMS
  end

end
