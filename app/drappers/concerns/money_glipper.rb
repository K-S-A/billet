module MoneyGlipper

  def display_price(options={})
    options = { with_currency: true }.merge(options)
    method = options.delete(:method) { :amount }
    html_options = options.delete(:html) { {} }

    content_tag :span, h.humanized_money(resource.public_send(method), options), {class: 'rate'}.merge(html_options)
  end

  def display_currency(options={})
    o.currency
  end

end
