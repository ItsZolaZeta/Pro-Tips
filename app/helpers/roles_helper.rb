module RolesHelper
  #functions here should be for the view, ruby code that shouldn't overload a view
  def can_edit?(tip)
    if(current_user)
      case(current_user.role)
      when 'admin' then true
      when 'registered' then current_user == tip.user
      else false
      end
    else
      false
    end
  end
end