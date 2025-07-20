module PayloadHelper
  def render_attribute(attribute)
    case attribute
    when Array
      render_array_attribute(attribute)
    when TrueClass, FalseClass
      render_boolean_attribute(attribute)
    else
      attribute
    end
  end

  def render_array_attribute(attribute)
    content_tag(:div, class: "mt-1") do
      safe_join(
        attribute.map do |val|
          content_tag(:span, val, class: "badge bg-info text-white me-1")
        end
      )
    end
  end

  def render_boolean_attribute(attribute)
    return content_tag(:i, "", class: "h2 bi bi-check text-success") if attribute

    content_tag(:i, "", class: "h2 bi bi-x text-danger")
  end
end
