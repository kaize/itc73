class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    object.send("state_transitions")
  end

  def input
    label_method = :human_event
    value_method = :event
    current_state = template.content_tag(:span, "#{object.human_state_name}", class: "offset1 label label-info")

    out = @builder.collection_select(
      attribute_name, collection, value_method, label_method,
      input_options, input_html_options
    )
    (out << current_state).html_safe
  end
end
