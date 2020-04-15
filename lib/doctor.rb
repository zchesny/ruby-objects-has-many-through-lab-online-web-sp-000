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
    Appointment.all.select{|app| app.doctor == self}
  end

  def patients
    self.appointments.collect{|app| app.patient}.uniq
  end

  def new_appointment(name, patient)
    Appointment.new(name, self, patient)
  end

end
