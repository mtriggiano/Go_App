# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new # Usuario por defecto (visitante no logueado)

    if user.has_role?(:superadmin)
      can :manage, :all
    elsif user.roles.exists?
      user.roles.each do |role|
        role.permissions.each do |permission|
          can permission.action.to_sym, permission.subject_class.constantize
        end
      end
    else
      # Permisos para usuarios sin roles: Sólo pueden gestionar su propia cuenta
      can [:read, :update], AdminUser, id: user.id
      can :read, ActiveAdmin::Page, name: "Dashboard"
    end
  end
end
