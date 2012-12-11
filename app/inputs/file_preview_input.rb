class FilePreviewInput < SimpleForm::Inputs::FileInput
  def input
    style = options.delete(:preview_style)
    out = super
    if object.persisted? && object.send("#{attribute_name}?")
      url = object.send :"#{attribute_name}_url"
      name = File.basename url
      out << template.content_tag(:span, template.link_to(name, url, style))
    end
    out
  end
end

