class User < ActiveRecord::Base
  validates_presence_of :name, :message => "Name required."
  validates_numericality_of :age,
                            :only_integer => true,
                            :greater_than => 0,
                            :message => "Age must be number > 0."
end
