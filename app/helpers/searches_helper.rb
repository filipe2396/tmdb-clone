module SearchesHelper
  RESOURCE_CARD_MAPPING = {
    movie: 'movie_or_tv_show_card',
    tv: 'movie_or_tv_show_card',
    person: 'person_card'
  }.freeze

  FILTER_ARRAY = [
    ['all', '/'],
    ['movies', '/movie'],
    ['tv_shows', '/tv'],
    ['people', '/person']
  ].freeze

  def render_result(results)
    if results&.any?
      safe_join(results.map { |resource| render_resource_card(resource, params) })
    else
      t('.nothing_found')
    end
  end

  def render_resource_card(resource, params)
    partial_name = RESOURCE_CARD_MAPPING[resource.media_type&.to_sym || params[:media_type]&.to_sym]
    render partial_name, resource: resource if partial_name
  end

  def current_filter?(filter, params)
    filter.delete_prefix!('/')
    filter == params[:media_type] || params[:media_type].blank? && filter == ''
  end
end
