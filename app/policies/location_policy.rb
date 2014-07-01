class LocationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @location = model
  end

  def index?
    return false if @current_user.nil?
    @current_user.admin?
  end

  def show?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

end