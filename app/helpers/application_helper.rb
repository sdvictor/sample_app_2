module ApplicationHelper
  def title
    @title.present? ? " | " + @title : ""
  end
end
