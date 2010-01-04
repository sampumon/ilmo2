class User < ActiveRecord::Base
  validates_uniqueness_of :name, :allow_blank => false
  validates_presence_of :name
  
  # party group leadershipments
  has_many :ass_groups, :class_name => "Group", :foreign_key => "ass_id"

  # course (group) registrations
  has_many :partypools
  has_many :groups, :through => :partypools
  
  # http://github.com/thoughtbot/paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # protect from mass-assignment create and edit
  attr_accessible :name, :pass, :studentnum, :avatar
  # attr_protected :created_at, :updated_at
  
  # TODO: these prohibit console stuff :o
  #before_validation :authorize
  #before_destroy :authorize

  def self.authenticate(name, pass)
    user = self.find_by_name(name)
    if user && user.pass != pass
      user = nil
    end
    user
  end

protected
  def authorize
    unless Authorization.current_user == self
      raise Authorization::NotAllowed, "Can't edit other users' info!"
    end
  end  
end
