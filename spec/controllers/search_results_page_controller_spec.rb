require 'rails_helper'

describe SearchResultsPageController do
  let(:obj) { Obj.new({}) }

  before do
    request.for_scrivito_obj(obj)
  end

  it 'passes the query to Obj.where' do
    expect(Obj).to receive(:where)
      .with(:*, :contains_prefix, 'test')
      .and_return((1..15).each)

    get :index, q: 'test'

    expect(assigns(:search_results)).to eq((1..10).to_a)
  end

  context 'with blank query' do
    it 'does not call the backend' do
      expect(Obj).not_to receive(:where)

      get :index, q: '  '

      expect(assigns(:search_results)).to eq([])
    end
  end
end
