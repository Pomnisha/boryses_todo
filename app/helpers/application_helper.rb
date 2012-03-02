module ApplicationHelper
  def logo
    image_tag("logo.png", :alt => "ToDo List", :class => "round")
  end
end
