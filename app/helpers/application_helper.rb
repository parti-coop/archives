module ApplicationHelper
  ALLOWED_EXTENSIONS = %w(txt doc docx xls xlsx ppt pptx bmp gif jpeg jpg png bz2 dmg gz gzip iso rar tar tgz zip)
  def file_type_icon(content_type)
    mime_type = MIME::Types[content_type].first
    extension = mime_type.try(:preferred_extension)
    extension = 'txt' unless ALLOWED_EXTENSIONS.include?(extension)
    content_tag(:i, nil, class: ["fa", "fa-file-#{extension}-o"])
  end

  def human_datetime_f(date)
    date.strftime("%Y년 %m월 %d일 %H:%M")
  rescue ArgumentError
    date
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages()
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end
end
