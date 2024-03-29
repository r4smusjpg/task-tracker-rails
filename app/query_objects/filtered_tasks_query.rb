# how to use: FilteredTasksQuery.new(Task.all, status: 'not_started').all

class FilteredTasksQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:status, :title]

  def by_status(relation, status)
    relation.where(status: status)
  end

  def by_title(relation, title)
    relation.where('title LIKE ?', title)
  end
end
