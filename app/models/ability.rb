class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # guest user (no logueado)

    # Reset any previously defined abilities
    can :manage, :all if user.has_role?(:admin)
    # Define permisos para todos los usuarios
    can :read, OrdenTrabajo if user.has_permission?('ver_ordenes')
    # Ejemplo de configuración detallada para roles dentro de Active Admin
    if user.has_role?(:admin)
      can :manage, Role  # Permite al admin gestionar roles
    else
      can :read, Role    # Permite a otros usuarios leer sobre los roles, si necesario
    end

    # Restricciones para usuarios no administradores
    unless user.has_role?(:admin)
      # Aquí se pueden añadir restricciones específicas para usuarios no administrativos
      # Por ejemplo, pueden leer artículos pero no crearlos ni editarlos
      can :read, Article  # Asumiendo que los usuarios no administrativos pueden leer artículos
      cannot :manage, Article
    end
  end
end
