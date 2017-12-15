module ApplicationHelper

  def login_tags(options = {})
    raw("#{link_to("Login", login_path, options)}<br/>\n#{link_to("Create new account", new_user_path, options)}")
  end

  def user_name_possessive
    if current_user
      current_user.first_name + "'s"
    else
      "Your"
    end
  end

  def admin_edit_tag(item)
    if current_user && current_user.authorized?(item.store)
      link_to "Edit", edit_item_path(item), class: "btn btn-primary"
    end
  end

end
