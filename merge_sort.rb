class Sort
    attr_reader :list, :sorted

    def initialize(list)
        @list = list
        @sorted = merge_sort(@list)
    end

    private

    def merge_sort(list)
        if list.length < 2
            list
        else
            semi_sorted = []
            left = merge_sort(list[0...list.length/2])
            right = merge_sort(list[list.length/2..-1])
            until left.empty? || right.empty?
                left[0] < right[0] ? semi_sorted << left.shift : semi_sorted << right.shift #take care of nil values with begin
            end
            semi_sorted + (left + right)
        end
    end
end

list = Sort.new([1,6,5,8,3,3,5,9,10])
puts list.sorted