class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    @user.exist?
  end

  def update?
    @user.editor? || @user.author? unless @user.nil?
  end

  def destroy?
    @user.editor? || @user.author? unless @user.nil?
  end

  def permitted_attributes
    if @user.editor? || @user.author
      [:author, :author_url, :author_email, :content, :approved]
    else
      [:author, :author_url, :author_email, :content]
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.nil?
        scope.where(approved: true)
      elsif user.editor? || user.author?
        scope.all
      end
    end
  end
end
