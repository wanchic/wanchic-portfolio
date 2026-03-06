module HomeHelper
  def copyright_footer(name: nil, host: nil)
    return nil if name.blank? && host.blank?

    text = []
    text += [ safe_join([ "©",
            content_tag(:span, "", id: "y"),
                      name ], " ") ] if name.present?
    text += [ "Hosted on #{host}" ] if host.present?
    content_tag(:div, safe_join(text.compact, " • "))
  end
end
