require 'byebug'

class PolyTreeNode
    attr_reader :value
    attr_accessor :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_node)
        return @parent = nil if new_node.nil?
        unless @parent.nil?
            old_parent = @parent
            old_parent.remove_child(self)
        end
        @parent = new_node
        @parent.children << self
        @parent
    end

    def add_child(child_node)
        child_node.parent = self unless @children.include?(child_node)
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            child_node.parent = nil
            @children.delete(child_node) 
        else
            raise error
        end
    end

    def dfs(target)
        # p "Checking Node #{self.value}"
        return self if target == value
        # debugger
        self.children.each do |child|
            res = child.dfs(target)
            return res if res
        end
        nil
    end

    def bfs(target)
        q = []
        q.unshift(self)
        until q.empty?
            current_node = q.pop
            test_variable = current_node.value
            # puts "Checking Node #{test_variable}"
            return current_node if test_variable == target
            current_node.children.each { |child| q.unshift(child)}
        end
        nil
    end 
end