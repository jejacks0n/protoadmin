module Protoadmin::LayoutHelper

  def page_title
    parts = [site_title]
    parts << section_title if section_title
    parts.join(' | ').html_safe
  end

  def site_title
    t(:site_title, {:section => section_title}).html_safe
  end

  def section_title
    content_for(:section_title).html_safe
  end

  def user_information
    "John Doe (#{link_to '3 Messages', '#'})".html_safe
  end

  def breadcrumbs
    crumbs = []
    crumbs << link_to('Bread', '#')
    crumbs << link_to('Crumb', '#')
    crumbs << link_to('Path', '#')
    content_tag(:span, crumbs.join('').html_safe)
  end

end