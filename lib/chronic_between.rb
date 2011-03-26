#!/usr/bin/env ruby

# file: chronic_between.rb

class ChronicBetween

  def initialize(s)
    @s = s
  end

  def build_range(date)

    date_ranges = []

    # parse the days
    raw_days = @s.split(',')

    raw_days.each do |d|

      # e.g. Mon-Fri 9:00-16:30
      raw1 = d.match(/(\w+)-(\w+)\s+([^-]+)-(.*)/)
      
      if raw1 then

        d1, d2, rt1, rt2 = raw1.captures
        date_ranges << [[d1,rt1], [d2,rt2]].map do |d,r| 
          cdate = Chronic.parse(d, :now => (date - 1)
          DateTime.parse(cdate).strftime("%d-%b-%y") + ' ' + r)
        end

      else

        # e.g. Saturday
        day = d.strip[/^\w+$/]

        if day then
          cdate = Chronic.parse(day, :now => (date - 1))
          d1 = DateTime.parse(cdate.strftime("%d-%b-%y") + ' 00:00')
          d2 = d1 + 1
          date_ranges << [d1, d2]
        end
      end
    end
  end

  def within?(date)
    date_ranges = build_range date
    d = date_ranges.detect do |d1, d2|
      date.between? d1, d2
    end
    d ? true : false
  end

end
