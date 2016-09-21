class SettingPolicy < Struct.new(:user, :setting)
  def show?
    user.admin?
  end
end
