module CollectionSelectHelper

  def options_for(collection, options={})
    glip(collection).select_options(options)
  end

  def multiple_options_for(collection, options={})
    glip(collection).select_options({ input_html: { multiple: true } }.deep_merge(options))
  end

end