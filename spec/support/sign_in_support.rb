module SignInSupport
  def sign_in(user)
    visit root_path
    click_on 'ログイン'
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    within '.login-btn' do
      click_on 'ログイン'
    end
  end
end
