module Authorization

  class NotAllowed < SecurityError
  end

  # Controller-independent method for retrieving the current user.
  # Needed for model security where the current controller is not available.
  def self.current_user
    Thread.current["current_user"]
  end
  
  # Controller-independent method for setting the current user.
  def self.current_user=(user)
    Thread.current["current_user"] = user
  end
end
