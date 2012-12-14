class EduYearEndInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    current_year = Date.today.year
    year_start = current_year + 6
    year_end = current_year - 50
    (year_end..year_start).to_a.reverse
  end
end

