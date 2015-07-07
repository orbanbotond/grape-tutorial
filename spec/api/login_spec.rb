require 'rails_helper'

describe '/api/login' do
  context 'negative tests' do
    context 'missing params' do
      context 'password' do
      end
      context 'email' do
      end
    end
    context 'invalid params' do
      context 'incorrect password' do
      end
      context "with a non-existent login" do
      end
    end
  end
  context 'positive tests' do
    context 'valid params' do
    end
  end
end