xml.instruct!
xml << render(:formats => [:xml], :partial => "scripts/commands", :locals => { :commands => @script.commands.where("parent_id IS NULL") })

