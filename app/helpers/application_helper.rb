module ApplicationHelper
  def menu_active name
    if controller_name == name
      'active'
    else
      ''
    end
  end
end
