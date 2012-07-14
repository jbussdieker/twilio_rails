commands.each do |command|
    tag = "#{command.type}".to_sym
    xml.tag!(tag) do |xe|
      if command.children.count > 0
        xe << render(:formats => [:xml], :partial => "scripts/commands", :locals => { :commands => command.children })
      else
        xe << command.value
      end
    end
end

