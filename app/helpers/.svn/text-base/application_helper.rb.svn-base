# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # TODO: VOI MUNAN MUNA, MIKSI ALOIN TEKEMÄÄN TÄTÄ :/ :/ :/
  def render_site_path
    # link_to 'Home', root_path
    paths = request.request_uri.split("/").inject([]) do |paths, p|
      paths << {p => (paths.last ? paths.last.first.last + "/" : "") + p}
    end
    paths[0] = { "Home" => "/" }

    paths.map do |path|
      path.map do |what, to|
        link_to what, to
      end
    end.join(" > ")
    
    # link_to "Home", root_path
  end
  
  # group's pool-in status as "users/limit"
  # TODO: munan muna, muna muna muna
  def pool_count(group)
    "#{group.users.count}/#{group.limit}"
  end

end
