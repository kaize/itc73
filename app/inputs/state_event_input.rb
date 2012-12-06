class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    object.send("state_transitions")
  end

  def input
    label_method = :human_event
    value_method = :event

    @builder.collection_select(
      attribute_name, collection, value_method, label_method,
      input_options, input_html_options
    )
  end
end
