module HomeHelper
  def copyright_footer(name:, host: nil)
    text = [ safe_join([ "©",
            content_tag(:span, "", id: "y"),
                      name ], " ") ]
    text += [ "Hosted on #{host}" ] if host.present?
    content_tag(:div, safe_join(text, " • "))
  end
end
