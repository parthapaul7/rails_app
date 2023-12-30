class CompanyPolicy < ApplicationPolicy
  def create?
    user.admin?
  end 
  def show?
    # Define logic for showing a company
    # For example, you might check if the user is an admin or the creator of the company
    user.admin? || user == record.user
  end

  def update?
    # Define logic for updating/editing a company
    # For example, you might check if the user is an admin or the creator of the company
    user.admin? || user == record.user
  end

  def destroy?
    # Define logic for destroying a company
    # For example, you might check if the user is an admin or the creator of the company
    user.admin? || user == record.user
  end
end
