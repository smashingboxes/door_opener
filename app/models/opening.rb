class Opening
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :opened_by
  field :file_name
  attr_accessible :opened_by
end
