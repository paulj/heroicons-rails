require "view_component/base"

class HeroiconsRails::IconComponent < ViewComponent::Base
  def initialize(name:, size: 16, style: "solid", classes: [])
    style = style.to_s
    name = name.to_s

    raise "Size must be an integer" unless size.is_a?(Integer)
    raise "Style must be solid, outline, or mini" unless ["solid", "outline"].include?(style)
    raise "Name is invalid" unless name.match?(/\A[a-z0-9-]+\z/)

    @path = File.expand_path("./icons/#{size}/#{style}/#{name}.svg", __dir__)
    unless File.exist?(@path)
      raise "Heroicon not found: #{name} in #{size}/#{style}"
    end

    @classes = classes
  end

  def call
    Nokogiri::XML(File.read(@path)).root.set_attribute("class", @classes.join(" ")).to_xml
  end
end
