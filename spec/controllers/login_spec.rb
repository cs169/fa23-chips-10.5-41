require 'rails_helper'
require 'spec_helper'

RSpec.describe LoginController, type: :controller do
  let(:google_user_info) do
    {
      'provider' => 'google_oauth2',
      'uid' => '123456',
      'info' => {
        'first_name' => 'John',
        'last_name' => 'Doe',
        'email' => 'john.doe@example.com'
      }
    }
  end

  let(:github_user_info) do
    {
      'provider' => 'github',
      'uid' => '789012',
      'info' => {
        'name' => 'Jane Smith',
        'email' => 'jane.smith@example.com'
      }
    }
  end

  describe 'GET #login' do
    it 'renders the login template' do
      get :login
      expect(response).to render_template(:login)
    end
  end

  describe 'GET #google_oauth2' do
    it 'redirects to the root path after successful login' do
      request.env['omniauth.auth'] = google_user_info
      get :google_oauth2
      expect(response).to redirect_to(root_url)
    end
  end

  describe 'GET #github' do
    it 'redirects to the root path after successful login' do
      request.env['omniauth.auth'] = github_user_info
      get :github
      expect(response).to redirect_to(root_url)
    end
  end

  describe 'GET #logout' do
    it 'clears the current_user_id session and redirects to root path' do
      session[:current_user_id] = 1
      get :logout
      expect(session[:current_user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'private methods' do
    let(:controller) { described_class.new }

    describe '#create_session' do
      it 'redirects to the destination_url' do
        allow(controller).to receive(:redirect_to)
        allow(controller).to receive(:find_or_create_user).and_return(User.new(id: 1))

        controller.send(:create_session, :create_google_user)
        expect(controller).to have_received(:redirect_to).with(root_url)
      end
    end

    describe '#find_or_create_user' do
      it 'finds or creates a user based on user_info' do
        user = controller.send(:find_or_create_user, google_user_info, :create_google_user)
        expect(user).to be_a(User)
        expect(user.uid).to eq('123456')
      end
    end

    describe '#create_google_user' do
      it 'creates a Google user' do
        user = controller.send(:create_google_user, google_user_info)
        expect(user).to be_a(User)
        expect(user.provider).to eq(User.providers[:google_oauth2])
        expect(user.first_name).to eq('John')
        expect(user.last_name).to eq('Doe')
        expect(user.email).to eq('john.doe@example.com')
      end
    end

    describe '#create_github_user' do
      it 'creates a Github user' do
        user = controller.send(:create_github_user, github_user_info)
        expect(user).to be_a(User)
        expect(user.provider).to eq(User.providers[:github])
        expect(user.first_name).to eq('Jane')
        expect(user.last_name).to eq('Smith')
        expect(user.email).to eq('jane.smith@example.com')
      end
    end

    describe '#already_logged_in' do
      it 'redirects to user_profile_path if already logged in' do
        session[:current_user_id] = 1
        allow(controller).to receive(:redirect_to)
        controller.send(:already_logged_in)
        expect(controller).to have_received(:redirect_to).with(user_profile_path)
      end
    end
  end
end