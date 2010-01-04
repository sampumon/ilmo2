class Party < ActiveRecord::Base
  validates_presence_of :course, :time
  validates_uniqueness_of :time, :scope => :course_id
  belongs_to :course
  has_many :groups, :dependent => :destroy
end
