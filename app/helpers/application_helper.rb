module ApplicationHelper
  # Return a image tag for logo.
  def logo
    image_tag("logo.png", :alt => "CycleMaintenance.com", :class => "round") 
  end

  def racer
    image_tag("racer.png", :alt => "racer", :class => "round") 
  end

  # Return a title on a per-page basis.
  def title
    base_title = "CycleMaintenance.JP"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
