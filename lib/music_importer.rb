require 'pry'
class MusicImporter
    attr_accessor :path

    def initialize(path)
        self.path = path
    end

    def files
        Dir.glob(self.path + "/*.mp3").map {|file| file.gsub(path + "/", "")}
    end
end