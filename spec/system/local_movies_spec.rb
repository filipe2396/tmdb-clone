require 'rails_helper'

RSpec.describe 'LocalMovies', type: :system do
  let(:movie) { create(:movie) }

  shared_examples 'create/update' do |action|
    it 'saves the movie locally' do
      fill_in Movie.human_attribute_name(:tmdb_id), with: 1
      fill_in Movie.human_attribute_name(:title), with: 'Batman'
      click_on t("helpers.submit.#{action}", model: Movie.model_name.human)

      expect(page).to have_current_path(local_movies_path)
      expect(page).to have_content(t("local_movies.#{action}.success"))
    end

    context 'with invalid params' do
      it "doesn't save the movie" do
        fill_in Movie.human_attribute_name(:tmdb_id), with: ''
        click_on t("helpers.submit.#{action}", model: Movie.model_name.human)

        expect(page).to have_content(t('errors.messages.blank'))
      end
    end
  end

  describe 'new' do
    before { visit new_local_movie_path }

    it_behaves_like 'create/update', :create
  end

  describe 'edit' do
    before { visit edit_local_movie_path(movie) }

    it_behaves_like 'create/update', :update
  end

  describe 'destroy', :js do
    before do
      movie
      visit local_movies_path
      click_on movie.title
      accept_alert { click_on t('application.movie_or_tv_show_modal.destroy') }
    end

    context 'when the movie has been destroyed' do
      it 'shows a success message' do
        expect(page).to have_content(t('local_movies.destroy.success'))
      end
    end

    context 'when failed to destroy the movie' do
      before { allow_any_instance_of(Movie).to receive(:destroy).and_return(false) }

      it 'shows an error message' do
        expect(page).to have_content(t('local_movies.destroy.failed'))
      end
    end
  end

  describe 'favorite' do
    let(:user) { create(:user) }

    before do
      movie
      login_as user
      visit local_movies_path
      click_on movie.title
    end

    context 'when favorite a movie' do
      it 'shows a success message' do
        click_on t('application.movie_or_tv_show_modal.favorite')
        expect(page).to have_content(t('local_movies.favorite.favorited'))
      end
    end

    context 'when unfavorite a movie' do
      let(:user) { create(:user, :with_favorites) }
      let(:movie) { user.favorites.first }

      it 'shows a success message' do
        click_on t('application.movie_or_tv_show_modal.unfavorite')
        expect(page).to have_content(t('local_movies.favorite.unfavorited'))
      end
    end
  end
end
