commands.each do |command|
    tag = "#{command.type}".to_sym
    attrs = Hash[*command.tags.collect{|a|[a.name, a.value]}.flatten]
    xml.tag!(tag, attrs) do |xe|
      if command.children.count > 0
        xe << render(:formats => [:xml], :partial => "scripts/commands", :locals => { :commands => command.children })
      else
        xe << render_value(command.value)
      end
    end
end

