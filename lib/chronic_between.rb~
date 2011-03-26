#!/usr/bin/env ruby

# file: chronic_between.rb

require 'chronic'
require 'date'

class ChronicBetween

  def initialize(s)
    @s = s
    @date_ranges = []
  end
  
  def within?(date)
    params = {}
    @app = AppRoutes.new(params)
    ranges(params, date)    
    build_range date
    
    d = @date_ranges.detect do |d1, d2|
      date.between? d1, d2
    end
    d ? true : false
  end  
  
  private
  
  def ranges(params, date)

    @app.routes do

      # e.g. Mon-Fri 9:00-16:30
      get %r{(\w+)-(\w+)\s+([^-]+)-(.*)} do 
        
        d1, d2, rt1, rt2 = params[:captures]

        @date_ranges << [[d1,rt1], [d2,rt2]].map do |d,r| 
          cdate = Chronic.parse(d, :now => (date - 1))
          DateTime.parse(cdate.strftime("%d-%b-%y") + ' ' + r)
        end

      end

      # e.g. Saturday
      get %r{^(\w+)$} do
        day = params[:captures].first
        cdate = Chronic.parse(day, :now => (date - 1))
        d1 = DateTime.parse(cdate.strftime("%d-%b-%y") + ' 00:00')
        d2 = d1 + 1
        @date_ranges << [d1, d2]
      end

      # e.g. 3:45-5:15
      get %r{(\d+:\d+)-(\d+:\d+)} do
        t1, t2 = params[:captures]        
        @date_ranges << [t1,t2].map {|t| DateTime.parse(t)}
      end

    end

  end
  
  def get(arg,&block)
    @app.get(arg, &block)
  end      

  def build_range(date)
    # parse the days
    raw_days = @s.split(',')
    raw_days.each {|d| @app.run(d.strip)}
  end

end
