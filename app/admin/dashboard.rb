# app/admin/dashboard.rb
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end

  controller do
    before_action :redirect_if_no_roles

    private

    def redirect_if_no_roles
      if current_admin_user.roles.empty?
        redirect_to edit_user_management_admin_user_path(current_admin_user), alert: "No tienes acceso al panel de administración. Solo puedes gestionar tu información personal."
      end
    end
  end
end
