require 'rails_helper'

RSpec.describe SaveMoviesJob, type: :job do
  describe '#perform_now' do
    subject(:perform) { described_class.perform_now(results, type) }

    let(:type) { :movie }
    let(:results) { [{ id: 1, title: 'Batman' }, { id: 2, title: 'Superman' }] }

    it 'saves all movies on database' do
      expect { perform }.to change(Movie, :count).from(0).to(2)
    end

    context 'when type equals to :multi' do
      let(:type) { :multi }
      let(:results) { [{ id: 1, title: 'Batman', media_type: 'movie' }, { id: 2, media_type: 'person' }] }

      it 'only saves movies on database' do
        expect { perform }.to change(Movie, :count).from(0).to(1)
      end
    end

    context 'with an invalid type' do
      let(:type) { :person }

      it 'do nothing' do
        expect { perform }.not_to change(Movie, :count)
      end
    end

    context 'when the movie already exists on database' do
      let(:results) { [{ id: 1, title: 'Batman' }] }

      before { create(:movie, tmdb_id: 1) }

      it 'do nothing' do
        expect { perform }.not_to change(Movie, :count)
      end
    end
  end
end
