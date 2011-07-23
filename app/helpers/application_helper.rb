module ApplicationHelper
  def logo
    image_tag("rails.png", :alt => "logo", :class => "round")
  end
  def title
    @title.present? ? " | " + @title : ""
  end
end
