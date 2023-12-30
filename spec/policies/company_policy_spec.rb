# spec/policies/company_policy_spec.rb
require 'rails_helper'

describe CompanyPolicy do
  subject { described_class.new(user, company) }

  let(:company) { create(:company) }
  let(:user) { create(:user) }

  context 'when the user is an admin' do
    let(:user) { create(:user, admin: true) }

    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'when the user is the owner of the company' do
    let(:user) { create(:user) }
    let(:company) { create(:company, user: user) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'when the user is not an admin and not the owner of the company' do
    it { is_expected.not_to permit_action(:show) }
    it { is_expected.not_to permit_action(:update) }
    it { is_expected.not_to permit_action(:destroy) }
  end
end
