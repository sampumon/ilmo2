class Group < ActiveRecord::Base
  validates_presence_of :party
  validates_uniqueness_of :time, :scope => :party_id
  belongs_to :party
  
  # assari/assistant
  belongs_to :ass, :class_name => "User"

  has_many :partypools
  has_many :users, :through => :partypools

  # TODO: muna kulli lutku
  # validates_exclusion_of :limit, :in => 0..1

  # does not work here :/
  # validates_uniqueness_of :user

  # attempt group pool-in
  # if over limit, will soft-queue and return false
  def pool_in(user)
    users << user
    if limit and users.count > limit then false else true end
  end
  
  # TODO: should these users be sorted by partypool created_at?
  
  def users_pooled
    users.first limit
  end
  
  def users_queued
    users[limit..-1]
  end
  
  def pooled_in?(user)
    if limit
      users.index(user) and users.index(user) < limit
    else
      true
    end
  end
end
