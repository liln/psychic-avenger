class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    !@user.nil?
  end

  def update?
    @user.editor? || @user.author? unless @user.nil?
  end

  def destroy?
    @user.editor? || @user.author? unless @user.nil?
  end

  def approver?
    @user.editor? || @user.author? unless @user.nil?
  end

  def permitted_attributes
    if user.nil? || user.user?
      [:author, :author_url, :author_email, :content]
    elsif @user.editor? || @user.author?
      [:author, :author_url, :author_email, :content, :approved]
    else
      [:author, :author_url, :author_email, :content]
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.nil? || user.user?
        scope.where(approved: true)
      elsif user.author?
        scope.all  #change so that only works for posts where the user is the author of the post
      elsif user.editor?
        scope.all
      end
    end
  end
end
