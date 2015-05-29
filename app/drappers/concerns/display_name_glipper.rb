module DisplayNameGlipper
  extend ActiveSupport::Concern

  def blank_display_name
    self.blank_display_name_backward
  end

  def blank_display_name_backward
    self.blank_display_name_assumption ? resource.public_send(self.blank_display_name_assumption) : self.blank_display_name_default
  end

  def blank_display_name_assumptions
    %w{full_name name title subject}
  end

  def blank_display_name_assumption
    Array.wrap(self.blank_display_name_assumptions).find do |method_name|
      resource.respond_to?(method_name) && resource.public_send(method_name)
    end
  end

  def blank_display_name_default
    o.id ? "#{resource.class.model_name.human} #{resource.id}" : "New #{resource.class.model_name.human}"
  end

  def display_name(options={})
    self.blank_display_name
  end

end
