class Card
  attr_accessor :ms, :todo, :item
  def initialize(ms, todo, item)
    @ms, @todo, @item = ms, todo, item
  end
  
  def hours
    return 0 unless (match = /([0-9]*\.[0-9]+|[0-9]+)h$/.match(item.content))
    match[1].to_f
  end

  def description
    item.content.gsub(/\s+([0-9]*\.[0-9]+|[0-9]+)h$/, '')
  end

  class << self
    def find(milestone_title)
      cards = []
      milestone = find_milestone(milestone_title)
      todos = find_todos(milestone)
      todos.each do |todo|
        items = find_items(todo)
        items.each do |item|
          cards << Card.new(milestone, todo, item)
        end
      end
      cards
    end
    
    def find_milestone(title)
      milestones = Basecamp::Base.find(:all, :from => "/projects/#{Basecamp::PROJECT_ID}/milestones/list")
      milestone = milestones.find {|ms| ms.title == title }
      raise ActiveRecord::RecordNotFound unless milestone
      milestone
    end

    def find_todos(milestone)
      todos = Basecamp::Base.find( :all, 
                                   :from => "/projects/#{Basecamp::PROJECT_ID}/todo_lists.xml" )
      
      todos = todos.inject([]) do |result, todo| 
        result << todo if todo.milestone_id == milestone.id
        result
      end
    end

    def find_items(todo)
      itesm = Basecamp::Base.find(:all, :from => "/todo_lists/#{todo.id}/todo_items.xml")
    end
  end
end
