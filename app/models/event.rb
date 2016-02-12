class Event < ActiveRecord::Base
  belongs_to :eventtype
  belongs_to :eventgroup
end
