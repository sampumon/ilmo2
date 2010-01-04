class Course < ActiveRecord::Base
  validates_presence_of :name
  # OBS ob: calling destroy destroys parties (and groups) calling delete does not!
  # http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html
  has_many :parties, :dependent => :destroy
end
