module ApplicationHelper
  def active_link_to(text, url, active:, **options)
    classes = options.delete(:class)
    classes << ' active' if active

    link_to text, url, class: classes, **options
  end

  def generate_modal_id(resource)
    media_type = resource.is_a?(Movie) ? 'movie' : resource.try(:media_type) || params[:media_type]
    "#{media_type}-#{resource.id}"
  end

  def movie_or_tv_show_name(resource)
    resource.title || resource.name
  end

  def movie_or_tv_show_date(resource)
    date = resource.try(:release_date) || resource.try(:first_air_date)

    return date if date.is_a?(Date)

    Date.parse(date) if date.present?
  end

  def link_to_resource_modal(resource, &block)
    link_to 'javascript:;',
      class: 'text-decoration-none',
      data: { 'bs-toggle': 'modal', 'bs-target': "##{generate_modal_id(resource)}" },
      &block
  end
end
