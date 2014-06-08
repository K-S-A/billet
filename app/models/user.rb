class User < ActiveRecord::Base
  include Clearance::User

  belongs_to :company

  def display_name
    return self.email.to_s.split('@').first if self.email
    return "User #{self.id}" if self.id
    return "New user"
  end

  def config
    Settings.default_user_config
  end

end