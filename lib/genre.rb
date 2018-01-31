class Genre
    attr_accessor :name, :songs

    extend Concerns::Findable

    @@all = []

    def initialize(name)
        self.name = name
        self.songs = []
    end

    def self.all
        @@all
    end

    def save
        self.class.all.push(self)
    end

    def add_song(song)
        self.songs.push(song) unless self.songs.include?(song)
        song.genre = self unless song.genre
    end

    def artists
        self.songs.map{ |song| song.artist }.uniq
    end
end