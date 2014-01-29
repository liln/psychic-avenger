class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    @user.author? || @user.editor? unless @user.nil?
  end

  def update?
    @user.editor? || @user.author? unless @user.nil?
  end

  def destroy?
    @user.editor? unless @user.nil?
  end

  def publish?
    @user.editor? unless @user.nil?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.nil?
        scope.where(published: true)
      elsif user.editor? || user.author?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end
end
