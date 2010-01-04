class Feed < ActiveRecord::Base
  named_scope :recent, lambda { |n|
    { :order => "created_at DESC", :limit => n }
  }

  def self.pool_in user, group
    Feed.create :body => "User #{user.name} pooled into #{group.party.course.name} (#{group.party.time}): #{group.time}"
  end

  def self.pool_out user, group
    Feed.create :body => "User #{user.name} left #{group.party.course.name} (#{group.party.time}): #{group.time} :/"
  end
end
