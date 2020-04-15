class Doctor

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select{|app| song.doctor == app}
  end

  def patients
    self.appointments.collect{|song| song.genre}.uniq
  end

  def new_appointment(name, genre)
    Appointment.new(name, self, genre)
  end

end
