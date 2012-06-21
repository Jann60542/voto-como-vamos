require 'spec_helper'

describe CandidatesController do
  let(:candidate_id) { '1' }
  let(:candidate) { double('candidate') }
  
  before :each do
    controller.stub!(current_user: true)
  end

  describe 'showing' do
    before(:each) do
      Candidate.should_receive(:find).with(candidate_id).and_return(candidate)
      get :show, {:id => candidate_id }
    end

    it { should respond_with(:success) }
    it { should assign_to(:candidate).with(candidate) }
    it { should render_template('show') }
  end

  describe 'editing' do
    before(:each) do
      Candidate.should_receive(:find).with(candidate_id).and_return(candidate)
      get :edit, {:id => candidate_id }
    end
    
    it { should respond_with(:success) }
    it { should assign_to(:candidate).with(candidate)}
    it { should render_template('edit') }
  end

  
end