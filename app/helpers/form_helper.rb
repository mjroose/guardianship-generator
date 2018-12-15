module FormHelper
  def form_row(column_width)
    content_tag :div, class: 'row mb-3' do
      content_tag :div, class: "col-md-#{column_width}" do
        yield
      end
    end
  end
end