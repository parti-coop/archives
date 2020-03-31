class ApplicationController < ActionController::Base
  def errors_to_flash(model)
    flash[:error] = model.errors.full_messages.join('<br>').html_safe
  end

  def errors_to_flash_now(model)
    flash.now[:error] = model.errors.full_messages.join('<br>').html_safe
  end
end
