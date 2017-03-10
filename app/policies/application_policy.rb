class ApplicationPolicy
  attr_reader :token, :user, :record

  def initialize(token, record)
    @token = token
    @record = record
    @user = token.try(:resource_owner)
  end

  def index?
    true
  end

  def show?
    true
  end

  def admin?
    user && user.has_role?(:admin)
  end

  alias_method :create?, :admin?
  alias_method :update?, :admin?
  alias_method :destroy?, :admin?

  def scope
    Pundit.policy_scope!(token, record.class)
  end

  class Scope
    attr_reader :token, :user, :scope

    def initialize(token, scope)
      @token = token
      @scope = scope
      @user = token.try(:resource_owner)
    end

    def resolve
      scope
    end
  end
end
