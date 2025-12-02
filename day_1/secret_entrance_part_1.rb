class Node
    attr_accessor :value, :left, :right

    def initialize(value)
        @value = value
    end
end

class CircularLinkedList

    attr_accessor :head, :size
    
    def initialize
        @head = nil
        @size = 0
        @first_node = nil
    end

    def move_head_left(distance)
        distance.times do 
            @head = @head.left
        end

        @head
    end

    def move_head_right(distance)
        distance.times do 
            @head = @head.right
        end

        @head
    end

    def add(node)
        
        if @head.nil?
            @head = node
            @first_node = node
        elsif size == 1
            @first_node.right = node
            @first_node.left = node

            node.right = @first_node
            node.left = @first_node

            @head = node
        else
            @head.right = node
            node.left = @head

            @first_node.left = node
            node.right = @first_node
            @head = node
        end

        @size += 1 
    end
end

circular_linked_list = CircularLinkedList.new

100.times do |n|
    circular_linked_list.add(Node.new(n))
end

zeros_count = 0;

start_head = circular_linked_list.move_head_left(49)
puts "Start head value: #{start_head.value}"


File.foreach('data.txt', chomp: true) do |line|
    puts line
    distance = line[1..].to_i
    distance = distance % 100

    if line.start_with?('R')
        circular_linked_list.move_head_right(distance)

    elsif line.start_with?('L')
        circular_linked_list.move_head_left(distance)
    else
        puts 'Error'
        return
    end
    p "current vlaue: #{circular_linked_list.head.value}"
    zeros_count += 1 if circular_linked_list.head.value.zero?

end

puts "Zeros count: #{zeros_count}"