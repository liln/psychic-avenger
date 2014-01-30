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

  def permitted_attributes
    if @user.editor?
      [:title, :body, :published]
    else
      [:title, :body]
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.nil? || user.user?
        scope.where(published: true)
      elsif user.editor?
        scope.all
      elsif user.author?
        scope.where(author: user)
      end
    end
  end
end
