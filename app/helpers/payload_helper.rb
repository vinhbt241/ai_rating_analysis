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

  def render_sentiment_analysis_explains(payload:)
    explains = payload.sentiment_analysis_result["explain"] || []

    content_tag(:div, class: "d-flex gap-1 flex-wrap") do
      safe_join(
        explains.map do |explain|
          text_css = ""
          if explain[1] >= 0.1
            text_css = "text-success"
          elsif explain[1] <= -0.1
            text_css = "text-danger"
          end

          content_tag(:div, class: "d-flex flex-column justify-content-center align-items-center gap-1 mt-2 #{text_css}") do
            safe_join([
              content_tag(:span, explain[0], class: "border"),
              content_tag(:span, explain[1].round(2), class: "border")
            ])
          end
        end
      )
    end
  end
end
