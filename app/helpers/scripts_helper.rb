module ScriptsHelper
  def command_links(command)
    if command.type.name == "Gather" or command.type.name == "Dial"
      concat(link_to "", new_script_command_path(@script, parent_id: command), :class => "hover-show icon-file")
    else
      concat("<i class='icon-blank'></i>".html_safe)
    end

    concat(" ")
    concat(link_to "", edit_script_command_path(@script, command), :class => "hover-show icon-edit")
    concat(" ")
    concat(link_to "", script_command_path(@script, command), method: :delete, :class => "hover-show icon-trash")
    concat(" ")
    concat(link_to "", move_script_command_path(@script, command, direction: "move_higher"), method: :put, class: "icon-circle-arrow-up hover-show")
    concat(link_to "", move_script_command_path(@script, command, direction: "move_lower"), method: :put, class: "icon-circle-arrow-down hover-show")
    concat(" ")
    return
  end

  def attribute_links(command)
    concat(link_to "", new_script_command_tag_path(@script, command), :class => "hover-visible icon-file")
    command.tags.each do |tag|
      concat(" #{tag.name}=\"#{tag.value}\"".html_safe)
      concat(link_to "", edit_script_command_tag_path(@script, command, tag), :class => "hover-visible icon-edit")
      concat(link_to "", script_command_tag_path(@script, command, tag), method: :delete, :class => "hover-visible icon-trash")
    end
    return
  end

  def open_tag(command)
    concat(command_links(command))
    concat("<#{command.type}")
    concat(attribute_links(command))
    concat(">")
    concat(command.value)
    return
  end

  def close_tag(command)
    concat("</#{command.type}>")
    return
  end
end
