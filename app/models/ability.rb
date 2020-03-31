class Ability
  include CanCan::Ability

  def initialize(user, params = {})
    can [:read], :all
    can [:download], ArchiveDocument

    if user
      if user.admin?
        can :manage, :all
      end
    end
  end
end
