# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new # Usuario por defecto (visitante no logueado)

    if user.roles.exists?
      if user.roles.any? { |role| role.name == 'Admin' }
        can :manage, :all
      else
        user.roles.each do |role|
          role.permissions.each do |permission|
            can permission.action.to_sym, permission.subject_class.constantize
          end
        end
      end
    else
      # Permisos para usuarios sin roles: Sólo pueden gestionar su propia cuenta
      can [:read, :update], AdminUser, id: user.id
      can :read, ActiveAdmin::Page, name: "Dashboard" # Permitir acceso al dashboard
    end
  end
end
