xml.instruct!
xml.Response do
  xml << render(:formats => [:xml], :partial => "scripts/commands", :locals => { :commands => @script.commands.where("parent_id IS NULL") })
end
