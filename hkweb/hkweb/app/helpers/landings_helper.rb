module LandingsHelper
  def groups_for_select(groups)
    groups.all.map { |group| [group, group.id] }
  end
end
