module Protoadmin::MessageHelper

  def flash_messages
    messages = Protoadmin::Responder.flash_keys.inject('') { |memo, type| memo + message_for_flash_type(type) }
    content_tag(:div, messages.html_safe, :id => 'flash_messages') if messages.present?
  end

  private

  def message_for_flash_type(type)
    message = flash[type.to_sym] || flash.now[type.to_sym]
    message.blank? ? '' : content_tag(:div, message, :class => "#{type} flash-message")
  end

end
