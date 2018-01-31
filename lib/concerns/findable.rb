module Concerns::Findable
    def create(name)
        object = self.new(name)
        object.save
        object
    end

    def find_by_name(name)
        self.all.find { |obj| obj.name == name } 
    end

    def find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def destroy_all
        self.all.clear
    end
end