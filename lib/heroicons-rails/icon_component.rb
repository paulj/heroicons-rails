require "view_component/base"

class HeroiconsRails::IconComponent < ViewComponent::Base
  def initialize(name, size: 16, style: "solid", classes: [])
    style = style.to_s
    name = name.to_s.gsub(/_/, "-") # Allow names to be symbols like :adjustments_horizontal

    raise "Size must be an integer" unless size.is_a?(Integer)
    raise "Style must be solid, outline, or mini" unless ["solid", "outline"].include?(style)
    raise "Name '#{name}'is invalid" unless name.match?(/\A[a-z0-9-]+\z/)

    @path = File.expand_path("./icons/#{size}/#{style}/#{name}.svg", __dir__)
    unless File.exist?(@path)
      raise "Heroicon not found: #{name} in #{size}/#{style}"
    end

    @classes = ["hi", "hi-#{style}", "hi-#{name}", *classes]
  end

  def call
    Nokogiri::XML(File.read(@path)).
      tap do |x|
        x.root.set_attribute("class", @classes.join(" "))
        x.root.set_attribute("fill", "currentColor") if x.root.attribute("fill").present? && x.root.attribute("fill").value != "none"
        x.css("path").each do |path|
          path.set_attribute("fill", "currentColor") if path.attribute("fill").present? && path.attribute("fill").value != "none"
          path.set_attribute("stroke", "currentColor") if path.attribute("stroke").present? && path.attribute("stroke").value != "none"
        end
      end.
      to_xml.
      html_safe
  end
end
