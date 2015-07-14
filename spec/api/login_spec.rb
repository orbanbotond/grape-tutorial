require 'rails_helper'

describe '/api/login' do
  let(:email) { user.email }
  let(:password) { user.password }
  let!(:user) { create :user }
  let(:original_params) { { email: email, password: password } }
  let(:params) { original_params }

  def api_call *params
    post "/api/login", *params
  end

  context 'negative tests' do
    context 'missing params' do
      context 'password' do
        let(:params) { original_params.except(:password) }

        it_behaves_like '400'
        it_behaves_like 'json result'
        it_behaves_like 'contains error msg', 'password is missing'
      end
      context 'email' do
        let(:params) { original_params.except(:email) }

        it_behaves_like '400'
        it_behaves_like 'json result'
        it_behaves_like 'contains error msg', 'email is missing'
      end
    end
    context 'invalid params' do
      context 'incorrect password' do
        let(:params) { original_params.merge(password: 'invalid') }

        it_behaves_like '401'
        it_behaves_like 'json result'

        it_behaves_like 'contains error msg', 'Bad Authentication Parameters'
      end
      context "with a non-existent login" do
        let(:params) { original_params.merge(email: 'notreal', password: 'invalid') }
        it_behaves_like '401'
        it_behaves_like 'json result'

        it_behaves_like 'contains error msg', 'Bad Authentication Parameters'
      end
    end
  end
  context 'positive tests' do
    context 'valid params' do
      it_behaves_like '200'
      it_behaves_like 'json result'

      specify 'returns the token as part of the response' do
        api_call params
        expect(JSON.parse(response.body)['token']).to be_present
      end
    end
  end
end