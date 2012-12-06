class SystemSlugInput < SimpleForm::Inputs::StringInput
  def input
    input_html_options.merge!(readonly: true) if object.system_slug?
    input_html_options.merge!(type: :text)
    super
  end
end
