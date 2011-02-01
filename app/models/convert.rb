class Convert < Tableless

	TIME_ZONES = ActiveSupport::TimeZone.all.sort { |x,y| x.name <=> y.name }.inject({}) { |b, x| b[x.tzinfo.name.match(/\w+/)[0]] = [] unless b[x.tzinfo.name.match(/\w+/)[0]]; b[x.tzinfo.name.match(/\w+/)[0]] << [ x.name, "#{x.tzinfo.name}:#{x.name}" ]; b }.to_a

	DEFAULT_DATETIME_FORMAT = '%d/%m/%Y %I:%M:%S %p'

	column :epoch, :string
	column :timezone, :string
	column :datetime, :string
	column :datetime_format, :string, self::DEFAULT_DATETIME_FORMAT

  validates_presence_of :timezone, :message => 'Timezone cannot be blank'
  validates_presence_of :datetime, :message => 'Date/time cannot be blank'
  validates_presence_of :datetime_format, :message => 'Date/time format field should not be blank'

  def save

		begin

			return false unless self.valid?

			if self.datetime.match(/\d{10,}/)
				t = Time.at(self.datetime.to_i)
			else
				t = Chronic.parse(self.datetime, { :now => TZInfo::Timezone.get(self.timezone).now })
			end

			return t.strftime(self.datetime_format)

		rescue Exception => e
			errors.add :datetime, "Chronic did not understand you, sorry."
			return false
		end

  end

end
