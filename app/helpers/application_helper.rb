module ApplicationHelper
  def render_stars(value)
    output = ''
    if (1..5).include?(value.floor)
      value.floor.times { output += image_tag('star.png')}
    end
    output.html_safe
    if value == (value.floor + 0.5) && value.to_i != 5
      output += image_tag('halfstar.png')
    end
    output.html_safe
  end
end
