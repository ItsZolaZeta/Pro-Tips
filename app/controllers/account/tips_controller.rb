module Account
  # This TipsController is namespaced within Account.  It is specifically for
  # use to view the Tips that the currently logged in User owns, and is entirely
  # separate from the other non-namespaced TipsController in
  # app/controllers/tips_controller.rb
  #
  # This is a better way to organize nested resources for something like an
  # account area than the AccountController used in the My Bucket List app. This
  # is because it follows a true resourceful structure, rather than using
  # unusual controller action names, like goals and ideas.
  class TipsController < ApplicationController
    before_action :ensure_authenticated
    
    def index
      @tips = current_user.tips
    end
  end
end
