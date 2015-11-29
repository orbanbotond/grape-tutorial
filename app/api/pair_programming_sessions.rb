class PairProgrammingSessions < Grape::API
  helpers ApiHelpers::AuthenticationHelper
  before { restrict_access_to_developers }
  before { authenticate! }

  format :json

  desc 'End-points for the PairProgrammingSessions'
  namespace :pair_programming_sessions do
    desc 'Retrieve the pairprogramming sessions'
    params do
      requires :token, type: String, desc: 'email'
    end
    get do
    end
  end
end
