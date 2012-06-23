# -*- encoding : utf-8 -*-
Dado /^que eu estou logado na aplicação$/ do
  @current_user = FactoryGirl.create :user
  login_with uid: @current_user.uid
end

Dado /^que existe um candidato$/ do
  @candidate = FactoryGirl.create :candidate
end

Quando /^eu acesso o perfil do mesmo$/ do
  visit candidate_path(@candidate)
end

Entao /^eu devo ver as suas informações$/ do
  [
    :alliance, :about, :name, :party
  ].each do |field|
    page.should have_content(@candidate.send(field))
  end
end

private

Dado /^que existem alguns candidatos$/ do
  @candidates = 3.times.map { |i| FactoryGirl.create(:candidate) }
end

Quando /^eu acesso a listagem de candidatos$/ do
  visit root_path
end

Entao /^eu devo ver tais candidatos$/ do
  @candidates.each do |candidate|
    page.should have_content(candidate.name)
  end
end

Quando /^escolho o perfil de um determinado candidato$/ do
  @candidate = @candidates.first
  click_link @candidate.name
end

def login_with(mock_options = nil)
  OmniAuth.config.test_mode = true

  if mock_options == :invalid_credentials
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  elsif mock_options
    OmniAuth.config.add_mock :facebook, mock_options
  end

  visit "/auth/facebook"
end

Dado /^que estou na minha página de candidato$/ do
  @candidate = Factory :candidate
  visit candidate_path(@candidate)
end

Quando /^que reinvindico propriedade sobre ela$/ do
  click_link "Sou esse candidato"
end

Quando /^preencho as informações necessárias$/ do
  pending # express the regexp above with the code you wish you had
end

Quando /^que aceito os termos de uso da aplicação$/ do
  pending # express the regexp above with the code you wish you had
end

Então /^devo receber uma confirmação de que a reinvidicação foi realizada$/ do
  pending # express the regexp above with the code you wish you had
end

Então /^os administradores da aplicação devem receber uma notificação para aprovação$/ do
  pending # express the regexp above with the code you wish you had
end