module TypeGlipper

  def display_type
    content_tag :span, t("##{o.class.to_s.underscore}", lookup: 'types'), class: 'object-type label label-info'
  end

end
