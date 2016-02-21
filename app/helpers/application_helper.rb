module ApplicationHelper
  def nav_link(link_text, link_path, extra_classes = nil, link_classes = nil)
    class_name = current_page?(link_path) ? 'is-current' : nil

    content_tag(:li, :class => [class_name, extra_classes]) do
      link_to(link_text, link_path, :class => [link_classes])
    end
  end
end
