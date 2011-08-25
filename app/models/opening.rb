class Opening
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :opened_by
  attr_accessible :opened_by
end
