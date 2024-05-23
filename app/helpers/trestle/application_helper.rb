module Trestle
    module ApplicationHelper
      def role_badge(user)
        role_class = case user.role
                     when "admin" then "badge badge-danger"
                     when "manager" then "badge badge-warning"
                     when "employee" then "badge badge-primary"
                     else "badge badge-secondary"
                     end
        content_tag(:span, user.role.humanize, class: role_class)
      end
    end
  end