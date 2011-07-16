class Protoadmin::Responder < ActionController::Responder

  # Automatically sets flash messages based on I18n API.  It checks for a message based on the current action, but also
  # allows defaults to be set, and overridden in the options.
  include Responders::FlashResponder

  cattr_accessor :flash_keys
  @@flash_keys = [:success, :notice, :alert, :error]

  def initialize(controller, resources, options = {})
    super
    @flash = options.delete(:flash)
    @flash_now = options.delete(:flash_now)

    @success = options.delete(:success)
    @notice = options.delete(:notice)
    @alert = options.delete(:alert)
    @error = options.delete(:error)
  end

  def set_flash_message!
    if has_errors?
      set_flash(:alert, @alert)
      status = :alert
    else
      set_flash(:success, @success)
      status = :success
    end

    return if controller.flash[status].present?

    options = mount_i18n_options(status)
    message = ::I18n.t options[:default].shift, options
    set_flash(status, message)
  end

end