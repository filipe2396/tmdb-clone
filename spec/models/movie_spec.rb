require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { build(:movie) }

  it { is_expected.to validate_presence_of(:tmdb_id) }
  it { is_expected.to validate_uniqueness_of(:tmdb_id) }
  it { is_expected.to validate_presence_of(:title) }
end
