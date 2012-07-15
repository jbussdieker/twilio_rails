module CommandsHelper
  def render_value(value)
    ERB.new("<%= \"" + value + "\" %>").result(@api_scope.get_binding)
  end
end
