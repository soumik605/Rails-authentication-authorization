class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?

    can :create, Post                                              #can create post
    can :read, Post                                                  #can read post
    can :update, Post, user: user                              #can update self post
    can :destroy, Post, user: user                              #can delete self post

    return unless user.admin?

    can :create, Post            #can create post
    can :read, Post                #can read post
    can :update, Post              #can update anyone's post
    can :destroy, Post              #can delete anyone's post

  end
end